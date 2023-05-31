# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_repo_install = tplroot ~ '.repo.install' %}
{%- set sls_dependencies_install = tplroot ~ '.dependencies.install' %}
{%- from tplroot ~ "/map.jinja" import mapdata as influxdb with context %}

include:
  - {{ sls_repo_install }}

influxdb/package/install:
  pkg.installed:
    - name: {{ influxdb.pkg.name }}
    - require:
      - sls: {{ sls_repo_install }}
      {% if influxdb.pkg.dependencies is defined %}
      - sls: {{ sls_dependencies_install }}
      {% endif %}


{% if grains['pythonexecutable'].startswith('/opt/saltstack/') %}

influxdb/package/install/pip/toml:
  pip.installed:
    - name: {{ influxdb.toml_module }}

{% endif %}

