FROM localhost/r-stable
LABEL maintainer="Adrian Sosa <asosam91@gmail.com>"

ARG RSTUDIO_VERSION
ARG BUILD_DATE

ENV BUILD_DATE ${BUILD_DATE:-2021-01-10}
ENV RSTUDIO_VERSION=${RSTUDIO_VERSION:-1.3.1093}

RUN yum update --disableplugin=subscription-manager -y
RUN bash -c "$(curl -L https://raw.githubusercontent.com/AdrianSosaUV/rstudio-container/main/install-rstudio.sh)"

RUN rm -rf /var/cache/yum \
   && rm rstudio-server-rhel-${RSTUDIO_VERSION}-x86_64.rpm

EXPOSE 8787
CMD ["/init"]
