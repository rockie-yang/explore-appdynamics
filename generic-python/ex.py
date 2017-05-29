
conf = {'app': 'appName',
        'tier': 'tierName',
        'node': 'nodeName2',
        'host': 'appdynamics',
        'port': '8080',
        'ssl': 'off',
        'account': 'customer1',
        'accesskey': '70d1e55a-8ac4-4ed4-865c-c66464784210'}

from time import sleep
from appdynamics.agent import api as appd

appd.init(conf)
# bt_handle = appd.start_bt('do work')

sleep(10)

# appd.end_bt(bt_handle)

FINANCIALS_ID_PROPS = {'Host': 'financials-lb', 'Port': 3456, 'Vendor': 'CUSTOM DB'}
with appd.bt('department rollup') as bt_handle:
	exit_call = appd.start_exit_call(bt_handle, appd.EXIT_DB, 'Financials Database', FINANCIALS_ID_PROPS)
	exc = None
	sleep(10)

	appd.end_exit_call(exit_call, exc)

appd.shutdown()