# -*- coding: utf-8 -*-
# vim: ft=sls

{% from "zookeeper/map.jinja" import zookeeper with context %}

zookeeper-config:
  file.managed:
    - name: {{ zookeeper.config.zoo_cfg }}
    - source: salt://zookeeper/files/conf/zoo.cfg
    - template: jinja
    - mode: 644
    - user: root
    - group: root

zookeeper-config-myid:
  file.managed:
    - name: {{ zookeeper.config.myid }}
    - source: salt://zookeeper/files/conf/myid
    - template: jinja
    - mode: 644
    - user: root
    - group: root
