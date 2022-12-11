#  TestSegues

Investigates forward and unwind segues.

```  
RedViewController --> GreenViewController --> BlueViewController |
|<---------------------------------------------------------------|
``` 


``` 
---- 2021-05-29 22:19:46.225597 RedViewController.viewDidLoad() 
---- 2021-05-29 22:19:46.235687 RedViewController.viewWillAppear(_:) 
---- 2021-05-29 22:19:46.526425 RedViewController.viewDidAppear(_:) 
---- RedViewController.toGreenButton 
---- 2021-05-29 22:19:50.973494 GreenViewController.viewDidLoad() 
---- 2021-05-29 22:19:51.296498 GreenViewController.viewWillAppear(_:) 
---- 2021-05-29 22:19:52.418074 GreenViewController.viewDidAppear(_:) 
---- GreenViewController.toBlueButton 
---- 2021-05-29 22:19:54.849773 BlueViewController.viewDidLoad() 
---- 2021-05-29 22:19:54.854108 BlueViewController.viewWillAppear(_:) 
---- 2021-05-29 22:19:55.359907 BlueViewController.viewDidAppear(_:) 
---- BlueViewController.unwindToRedButton 
---- RedViewController.unwindToRedVC(_:) 
---- 2021-05-29 22:19:58.722712 BlueViewController.viewWillDisappear(_:) 
---- 2021-05-29 22:19:58.738120 BlueViewController.viewDidDisappear(_:) 
---- 2021-05-29 22:19:58.739315 BlueViewController.deinit 
---- 2021-05-29 22:19:58.743068 GreenViewController.viewWillDisappear(_:) 
---- 2021-05-29 22:19:59.263514 GreenViewController.viewDidDisappear(_:) 
---- 2021-05-29 22:19:59.264118 GreenViewController.deinit 
``` 

```
---- 2022-12-11 00:28:35.306619 RedViewController.viewDidLoad() 
---- 2022-12-11 00:28:35.332430 RedViewController.viewWillAppear(_:) 
---- 2022-12-11 00:28:35.424737 RedViewController.viewDidAppear(_:) 

---- 2022-12-11 00:28:42.720062 RedViewController.toGreenButton 
---- 2022-12-11 00:28:42.726156 GreenViewController.viewDidLoad() 
---- 2022-12-11 00:28:42.744085 GreenViewController.viewWillAppear(_:) 
---- 2022-12-11 00:28:43.341599 GreenViewController.viewDidAppear(_:) 

---- 2022-12-11 00:28:49.908918 GreenViewController.toBlueButton 
---- 2022-12-11 00:28:49.912387 BlueViewController.viewDidLoad() 
---- 2022-12-11 00:28:49.918733 BlueViewController.viewWillAppear(_:) 
---- 2022-12-11 00:28:50.427153 BlueViewController.viewDidAppear(_:) 

---- 2022-12-11 00:28:56.135894 BlueViewController.unwindToRedButton 
---- 2022-12-11 00:28:56.136312 RedViewController.unwindToRedVC(_:) 
---- 2022-12-11 00:28:56.139281 BlueViewController.viewWillDisappear(_:) 
---- 2022-12-11 00:28:56.141373 GreenViewController.viewWillDisappear(_:) 
---- 2022-12-11 00:28:56.645622 GreenViewController.viewDidDisappear(_:) 
---- 2022-12-11 00:28:56.646899 BlueViewController.viewDidDisappear(_:) 
---- 2022-12-11 00:28:56.647223 BlueViewController.deinit 
---- 2022-12-11 00:28:56.648095 GreenViewController.deinit 
```


Above trace confirms that the unwind segue from Blue to Red does not cause the intermediate, Green, to execute a transient sequence

``` 
GreenViewController.viewWillAppear(_:) 
GreenViewController.viewDidAppear(_:) 
```
However, that behavoir was seen in at least one application.

This is not yet understood.

Possible hypotheses:

Green (in the other app) has more resources to unload and that takes time to the Green to execute `viewWillAppear(_:)`.

Green (in the other app) has a transient reference retain (not a reference cycle).
