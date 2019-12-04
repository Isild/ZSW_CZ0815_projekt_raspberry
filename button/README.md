# Definition of button service

## How to enable service

Set Your path to `button.py` script in `repo-dir/button/button.service`:
```
ExecStart=/usr/bin/python path-to-script/button.py
```

Put `button.service` in `/etc/systemd/system/`:
```
sudo cp repo-dir/button/button.service /etc/systemd/system
```

Enable auto start of service on boot:
```
sudo systemctl enable button.service
```

Start service immediately:
```
sudo systemctl start button.service
```

Check service status:
```
systemctl status button.service
```

## How to disable service:

Disable auto start of service on boot:
```
sudo systemctl disable button.service
```

Stop service immediately:
```
sudo systemctl stop button.service
```

Check service status:
```
systemctl status button.service
```

