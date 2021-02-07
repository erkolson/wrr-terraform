# We Are Rosie VPN

### Servers

[https://vpn-east.wearerosie.com](https://vpn-east.wearerosie.com): `35.211.112.48`
[https://vpn-west.wearerosie.com](https://vpn-west.wearerosie.com): `35.212.218.115`

### Architecture

Two independent VPN Servers, one in GCP us-west1 and one in us-east1.  Each
server contains a co-located pritunl and mongodb server.

### Installation

1.  Create infra with terraform.
1.  Run `scripts/install.sh` script to install pritunl and mongodb.
1.  Update database configuration in `/etc/pritunl.conf`
    ```
    {
      "mongodb_uri": "mongodb://localhost:27017/pritunl",
      ...
    }
    ```
1.  Restart and retrieve admin password
    ```
    sudo systemctl restart pritunl
    sudo pritunl default-password
    ```
1.  Log in with default username/password and update to a more secure password

### Backups

to come ...

### Replication

to come ...

### SSO

to come ...
