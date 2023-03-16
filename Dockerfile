FROM ubuntu:latest
COPY proyecto.sh /proyecto/

ENTRYPOINT ["/bin/bash", "/proyecto/proyecto.sh"]
