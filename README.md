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
