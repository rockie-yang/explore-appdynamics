import time
from time import sleep
from appdynamics.agent import api as appd



start = time.time()

appd.init({})

print ("init", "took", start - time.time())

# bt_handle = appd.start_bt('do work')

sleep(10)

# appd.end_bt(bt_handle)

start = time.time()

num = 1000

FINANCIALS_ID_PROPS = {'Host': 'financials-lb', 'Port': 3456, 'Vendor': 'CUSTOM DB'}

start = time.time()

for i in range(num):

	start2 = time.time()

	with appd.bt('department rollup') as bt_handle:

		print ("open bt", "took", time.time() - start2)	

		exit_call = appd.start_exit_call(bt_handle, appd.EXIT_DB, 'Financials Database', FINANCIALS_ID_PROPS)
		exc = None
		
		appd.end_exit_call(exit_call, exc)

print ("average bt", "took", time.time() - start , "ms")		

start = time.time()

appd.shutdown()
print ("shutdown", "took", time.time() - start, "ms")		
sleep(10)