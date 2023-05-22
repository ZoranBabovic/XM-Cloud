@echo off
cd %~dp0
copy /Y .env.local.tunnel .env.local
echo Set following environment variables on XM Cloud
echo MVP_RENDERING_EDITING_HOST_URI=https://xmc-59qqzdup3uinohoazx4prn.loca.lt:443/api/editing/render
echo MVP_RENDERING_HOST_PUBLIC_URI=https://xmc-59qqzdup3uinohoazx4prn.loca.lt:443/
echo JSS_EDITING_SECRET=4ICd4PAxaZFghajx9GBgA1
lt --port 3000 --subdomain xmc-59qqzdup3uinohoazx4prn