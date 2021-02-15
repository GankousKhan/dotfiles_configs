# MITM Setup

For additional filtering requests read the [docs](https://docs.mitmproxy.org/stable/concepts-filters/).

## Firefox

1. Download certificate from http://mitm.it
2. Open *Firefox Preferences > Advanced > Network > Manual Proxy Configuration*
3. Under *HTTP Proxy* type `127.0.0.1` in first field and `8080` under *Port*.
4. Under *SSL Proxy* do the same.
5. Hit save and run `mitmproxy --host` in terminal.

## Chrome

1. Download certificate from http://mitm.it
2. Open *Chrome Settings > Show Advanced Settings > Network Settings > HTTP*
3. Set the first field to `127.0.0.1` and on the right to the colon to `8080`.
4. Open HTTPS tab and do the same.
5. Hit save and run `mitmproxy --host` in terminal.
