cat > ~/.scripts/refre.sh <<EOL
date >> out.txt;
if pgrep 'firefox'; then
    echo 'Firefox is running; will not restart.\n' >> out.txt;
else
    echo 'Firefox is not running; restarting now.\n' >> out.txt;
    shutdown -r now;
fi  
EOL

sudo chmod +x ~/.scripts/refre.sh

crontab -l > mycron
echo "@daily ~/.scripts/refre.sh" >> mycron
crontab mycron
rm mycron

echo "Crontab reads:"
crontab -l
echo ""

echo "Preloading complete. Device will restart every night at midnight if Firefox is not open.\nNo further interaction is required."
rm preload.sh 