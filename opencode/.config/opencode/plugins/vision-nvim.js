// Managed by vision.nvim. Re-run :VisionInstall opencode to refresh this file.
import { spawnSync } from "node:child_process"
import { randomBytes } from "node:crypto"

const VISIONCTL = "/home/dokxid/.local/share/nvim/lazy/vision.nvim/bin/visionctl"
let counter = 0

function randomBase62(length) {
  const chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
  const bytes = randomBytes(length)
  let value = ""
  for (let i = 0; i < length; i++) {
    value += chars[bytes[i] % chars.length]
  }
  return value
}

function partID() {
  counter = (counter + 1) % 0x1000
  const stamp = (Date.now() * 0x1000 + counter).toString(16).padStart(12, "0").slice(-12)
  return "prt_" + stamp + randomBase62(14)
}

function promptText(parts) {
  if (!Array.isArray(parts)) return ""
  const items = []
  for (const part of parts) {
    if (part?.type === "text" && !part.synthetic && typeof part.text === "string") {
      items.push(part.text)
    }
  }
  return items.join("\n")
}

function extractContext(stdout) {
  const text = typeof stdout === "string" ? stdout.trim() : ""
  if (!text) return ""
  try {
    const payload = JSON.parse(text)
    if (typeof payload?.context === "string") return payload.context
    const hookOutput = payload?.hookSpecificOutput
    if (typeof hookOutput?.additionalContext === "string") return hookOutput.additionalContext
  } catch {
  }
  return ""
}

function visionContext(directory, input, output) {
  const cwd = typeof directory === "string" && directory ? directory : process.cwd()
  const payload = {
    prompt: promptText(output?.parts),
    cwd,
    sessionID: input?.sessionID,
    messageID: output?.message?.id,
  }
  const result = spawnSync(VISIONCTL, ["hook", "opencode"], {
    cwd,
    input: JSON.stringify(payload),
    encoding: "utf8",
    maxBuffer: 1024 * 1024,
  })
  if (result.error || result.status !== 0) return ""
  return extractContext(result.stdout)
}

export const VisionNvim = async ({ directory }) => ({
  "chat.message": async (input, output) => {
    try {
      if (!Array.isArray(output?.parts) || !input?.sessionID || !output?.message?.id) return
      const context = visionContext(directory, input, output)
      if (!context) return
      output.parts.push({
        id: partID(),
        sessionID: input.sessionID,
        messageID: output.message.id,
        type: "text",
        text: context,
        synthetic: true,
        metadata: { source: "vision.nvim" },
      })
    } catch {
    }
  },
})

export default VisionNvim
