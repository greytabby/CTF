The program will stop during the following function call, so use a hex editor to rewrite the relevant part as a NOP to avoid the function call.

```
2998:       e8 d3 f1 ff ff          call   1b70 <ada__calendar__delays__delay_for@plt>
```
