export const NotificationPlugin = async ({
  project,
  client,
  $,
  directory,
  worktree,
}) => {
  return {
    event: async ({ event }) => {
      // Send notification on session completion
      if (event.type === "session.idle") {
        await $`notify-send -a "opencode" -u "low" -i "/usr/share/icons/Yaru/16x16/emblems/emblem-insync-synced.png" "opencode" "prompt finished processing"`;
      }
    },
  };
};
