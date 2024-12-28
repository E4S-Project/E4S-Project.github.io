      
#!/bin/bash

# Update dependencies
npm install

# Create destination directories if they don't exist
mkdir -p assets/js
mkdir -p assets/bootstrap/js
mkdir -p assets/bootstrap/css
mkdir -p assets/bootstrap/fonts
mkdir -p assets/font-awesome/css
mkdir -p assets/font-awesome/webfonts

# Copy files from node_modules to assets, renaming to unversioned names

# jQuery
cp node_modules/jquery/dist/jquery.min.js assets/js/jquery.min.js

# Bootstrap
cp node_modules/bootstrap/dist/js/bootstrap.min.js assets/bootstrap/js/
cp node_modules/bootstrap/dist/css/bootstrap.min.css assets/bootstrap/css/
#cp node_modules/bootstrap/dist/js/bootstrap.min.js.map assets/bootstrap/js/
cp -r node_modules/bootstrap/dist/fonts/* assets/bootstrap/fonts/

# jQuery Backstretch
cp node_modules/jquery-backstretch/jquery.backstretch.min.js assets/js/

# WOW.js
cp node_modules/wowjs/dist/wow.min.js assets/js/

# Retina.js
cp node_modules/retinajs/dist/retina.min.js assets/js/

# Font Awesome
cp node_modules/@fortawesome/fontawesome-free/css/all.min.css assets/font-awesome/css/
cp -r node_modules/@fortawesome/fontawesome-free/webfonts/* assets/font-awesome/webfonts/

echo "JavaScript, CSS, and font files copied to assets directory."

    
