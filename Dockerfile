FROM kibana:5.0.0
MAINTAINER David J. M. Karlsen <david@davidkarlsen.com>

RUN 	kibana-plugin install x-pack && \
	echo "xpack.security.enabled: false"	>> /etc/kibana/kibana.yml && \
	echo "xpack.graph.enabled: false" 	>> /etc/kibana/kibana.yml && \
	echo "xpack.watcher.enabled: false"	>> /etc/kibana/kibana.yml && \
	echo "xpack.reporting.enabled: false" 	>> /etc/kibana/kibana.yml && \
	chown -R root:root /usr/share/kibana /etc/kibana && \
	chmod -R a+rw /usr/share/kibana/optimize
