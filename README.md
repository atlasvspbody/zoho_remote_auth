# zoho_remote_auth
Just a class to get the url for a remote authentication in Zoho. 

# How to use it:

1. Fill the constants TOKEN and BASIC_URL with yours.
2. Create an object `z=Zoho::RemoteAuth.new(email:'zack@zoho.com',loginname:'zack',fullname:'zack doe',utype:'portal')`
3. You have two methods to use `get_sign_up_url` and `get_sign_in_url` depending on what you want you can call them and get:
  * `z.get_sign_in_url`
    *http://yourpage.com/support/RemoteAuth?apikey=0b26a8398efb428287006f45998fe8e3&email=zack%40zoho.com&operation=signin&ts=1486076418702*
    
  * `z.get_sign_up_url`
    *http://yourpage.com/support/RemoteAuth?apikey=f02ba825f6feaca3f3db971e17c0177f&email=zack%40zoho.com&fullname=zack%2520doe&loginname=zack&operation=signup&ts=1486076922182&utype=portal*

# From zoho:
[Setting up Remote Authentication](https://help.zoho.com/portal/kb/articles/setting-up-remote-authentication)
