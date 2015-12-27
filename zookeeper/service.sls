# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "zookeeper/map.jinja" import zookeeper with context %}

include:
  - zookeeper.config

zookeeper-name:
  service.running:
    - name: {{ zookeeper.service.name }}
    - enable: True
    - watch:
      - file: zookeeper-config
      - file: zookeeper-config-myid
