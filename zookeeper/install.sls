# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "zookeeper/map.jinja" import zookeeper with context %}

zookeeper-java-pkg:
  pkg.installed:
    - name: {{ zookeeper.java.pkg }}
    - refresh: true

{{ zookeeper.conf.dataDir }}:
  file.directory:
    - user: {{ zookeeper.user }}
    - group: {{ zookeeper.group }}
    - file_mode: 644
    - dir_mode: 755
    - makedirs: True
    - recurse:
      - user
      - group
      - mode

{{ zookeeper.conf.dataLogDir }}:
  file.directory:
    - user: {{ zookeeper.user }}
    - group: {{ zookeeper.group }}
    - file_mode: 644
    - dir_mode: 755
    - makedirs: True
    - recurse:
      - user
      - group
      - mode

zookeeper-pkg:
  pkg.installed:
    - name: {{ zookeeper.pkg }}
    - refresh: true
    - require:
      - pkg: zookeeper-java-pkg

