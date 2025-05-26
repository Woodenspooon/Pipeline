#!/bin/bash

echo "==============================="
echo "🚀 Starting Deployment Process"
echo "==============================="

# Step 1: Move into the project directory
cd "$(dirname "$0")"

# Step 2: Install dependencies (if package.json exists)
if [ -f "package.json" ]; then
    echo "📦 Installing Node.js dependencies..."
    npm install
fi

# Step 3: Restart the app using pm2 (you can also use node directly)
if command -v pm2 &> /dev/null; then
    echo "🔁 Restarting the app using PM2..."
    pm2 restart app.js || pm2 start app.js
else
    echo "⚠️ PM2 not found. Starting app using 'node app.js' (this will block)"
    node app.js
fi

echo "✅ Deployment Complete"
