#!/bin/bash

echo "🚀 Starting enowxai..."
echo "Only for host not adding account!"
# login otomatis
enowxai login $ENOWX_API_KEY

# jalanin di background (biar gak nge-lock container)
enowxai start &

echo "✅ enowxai running!"
echo "👉 lu bisa masuk shell & jalanin command manual"
echo "help? use enowxai help"
# biar container tetep hidup
tail -f /dev/null
