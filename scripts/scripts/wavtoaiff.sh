# for each wav file in the directory, create an aiff file permutation across each bit depth and sample rate.
for FILE in *.wav; do
    # bit depths
    for BIT_DEPTH in 16; do
        # sampling rates
        for SAMPLING_RATE in 44100; do

            # sample_fmt is determined by the codec, which is determined by the muxer.
            # So check the muxer used for the file you're trying to convert to:
            #
            # > ffmpeg -h muxer=aiff
            # Muxer aiff [Audio IFF]:
            #     Common extensions: aif,aiff,afc,aifc.
            #     Mime type: audio/aiff.
            #     Default video codec: png.
            #     Default audio codec: pcm_s16be.
            #
            # Now check for the specific encoder names for that codec:
            #
            # > ffmpeg -codecs | grep -P 'pcm_s\d\dbe'
            # DEAI.S pcm_s16be            PCM signed 16-bit big-endian
            # DEAI.S pcm_s16be_planar     PCM signed 16-bit big-endian planar
            # DEAI.S pcm_s24be            PCM signed 24-bit big-endian
            # DEAI.S pcm_s32be            PCM signed 32-bit big-endian
            # DEAI.S pcm_s64be            PCM signed 64-bit big-endian

            # and make sure you use only the appropriate arguments for each.
            SAMPLE_FMT="s${BIT_DEPTH}"
            if [[ "$BIT_DEPTH" -eq "24" ]]; then
                # pcm_s24be codec only supports s32 sample_fmt (check with `ffmpeg -h encoder=pcm_s24be`)
                SAMPLE_FMT="s32"
            fi

            ffmpeg -i "$FILE" -ar "$SAMPLING_RATE" -sample_fmt "$SAMPLE_FMT" -y -acodec  "pcm_s${BIT_DEPTH}be" "${FILE%.wav}.aiff"

        done
    done
done
