# Neurogami::GHIssues

by James Britt / Neurogami

james@neurogami.com

http://www.neurogami.com

## DESCRIPTION:

CLI app to interact with GitHub 'issues' API

## FEATURES/PROBLEMS:

Quite new.  Does some useful stuff.  

Allows for fetching open tickets and adding new tickets from the command line.


## SYNOPSIS:

    ghissues open
        Lists open issues

    ghissues open reload
        Lists open issues after refreshing the local issues cache file.
    
    ghissues create 
        Creates new issue.  You get prompted for values
     

You need a .ghissues file in the directory from which you invoke the app.  It needs 
to be a YAML file, like this:

    owner:  your_github_account_name
    repo: the_repo_you_are_dealing_withm
    issues_cache_file: some_file_name_for_caching_issues.yaml

Also, you need to define an ENV value for GH_AUTH_TOKEN

See http://github.com/blog/170-token-authentication
       
## REQUIREMENTS:

Ruby.  I think that's all. And a github account and repo to use this with.  Oh, and issues. 


## INSTALL:

The usual gem install stuff, with the required github additions.

After adding github.com as a gem source, 

    sudo gem i neurogami-ghissues


## LICENSE:

(The MIT License)

Copyright (c) 2008 James Britt / Neurogami

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
