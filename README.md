# openrgb-server-container
🌈 a container for running OpenRGB in headless mode

Want to control the lights on your (physical) server and you really don't need a GUI? This is the image for you.

**Note**: so far I've only tested this with USB devices. [Changes may be required](https://github.com/dcflachs/docker-containers/blob/master/openrgb/02-fix-attrs-i2c.sh) for I2C devices.

## Usage

With USB device support:

```bash
docker create \
  -p 6742:6742 \
  -v /dev/bus/usb:/dev/bus/usb \
  --privileged
  --cap_add NET_BIND_SERVICE
  codetheweb/openrgb-server
```
