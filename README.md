# satosa-developer
A developer repo for SATOSA

## How?
To run all containerns just run `start.sh`. It will ask for permission to write to your /etc/hosts.

To run the container with your local repos just symlink the [SATOSA](https://github.com/IdentityPython/SATOSA) repo to the `sources` directory.


    satosa-developer
    ├── sources
    │   ├── SATOSA -> /.../SATOSA/

SATOSA will be reachable on [https://front.satosa.docker](https://front.satosa.docker).

You will also have a pysaml2 SP on [https://sp.satosa.docker](https://sp.satosa.docker), an IdP on [https://idp.satosa.docker](https://idp.satosa.docker) and a pyop OIDC OP on [https://op.satosa.docker](https://op.satosa.docker).

