#!/usr/bin/env python

import httplib
import json
import socket
import sys

conn = httplib.HTTPConnection("127.0.0.1:9200")
try:
    conn.request("GET", "/_cluster/stats")
except socket.error as e:
    sys.exit(1)
r = conn.getresponse()
data = r.read()
d = json.loads(data)

nodes = d['nodes']
jvm = nodes['jvm']
jvm_mem = jvm['mem']

cluster_jvm_heap_used_in_percent = float(jvm_mem['heap_used_in_bytes']) / float(jvm_mem['heap_max_in_bytes'])

indices = d['indices']
shards = indices['shards']

docs = indices['docs']

output = {
    'cluster_status': d['status'],
    'cluster_jvm_heap_used_in_percent': int(cluster_jvm_heap_used_in_percent * 100 * 10),
    'cluster_jvm_threads_count': int(jvm['threads']),
    'cluster_indices_count': int(indices['count']),
    'cluster_shards_primaries_count': int(shards['primaries']),
    'cluster_shards_replication_count': int(shards['replication']),
    'cluster_docs_count': int(docs['count']),
    'cluster_docs_deleted_count': int(docs['deleted']),
}

try:
    conn.request("GET", "/_cluster/health")
except socket.error as e:
    sys.exit(1)
r = conn.getresponse()
data = r.read()
d = json.loads(data)

output.update(d)

print(json.dumps(output))

