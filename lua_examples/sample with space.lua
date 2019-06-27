local function test()
print(node.heap())
print(node.egc.meminfo())
ads1115.reset()
local adc1 = ads1115.ads1115(0, ads1115.ADDR_GND)

-- continuous mode
adc1:setting(ads1115.GAIN_6_144V, ads1115.DR_128SPS, ads1115.SINGLE_0, ads1115.CONTINUOUS)
-- read adc result with read()
local volt, volt_dec, adc, sign = adc1:read()
print(volt, volt_dec, sign)

end
test()