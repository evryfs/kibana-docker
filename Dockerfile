FROM docker.elastic.co/kibana/kibana:6.2.3
label maintainer "David J. M. Karlsen <david@davidkarlsen.com>"

USER root
RUN 	\
	echo "xpack.security.enabled: false"	>> /usr/share/kibana/config/kibana.yml && \
	echo "xpack.graph.enabled: false" 	>> /usr/share/kibana/config/kibana.yml && \
	echo "xpack.watcher.enabled: false"	>> /usr/share/kibana/config/kibana.yml && \
	echo "xpack.reporting.enabled: false" 	>> /usr/share/kibana/config/kibana.yml && \
	chown -R kibana:kibana /usr/share/kibana
USER kibana
RUN ./bin/kibana-plugin install 'https://git.bitsensor.io/front-end/elastalert-kibana-plugin/builds/artifacts/6.2.3/raw/artifact/elastalert-kibana-plugin-latest.zip?job=build'
#https://github.com/elastic/kibana/issues/6057
RUN kibana  2>&1 | grep -m 1 "Optimization of .* complete in .* seconds" 

