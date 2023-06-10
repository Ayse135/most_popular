# most_popular_mobile

api url=http://api.nytimes.com/svc/mostpopular/v2/viewed/7.json?api-key=AXsHq5t4NUY9GAsaSLMkrVsenRSAvNCl

-lib 
	- assets
		- style
			in this folder I put some style projects which I will be need constant style items for desing. 
	
	- controller
		in controller I create model objects and fill them with api commands from 'core/services' folder.
		
	- core
		- services
			I create files in here to connect api url.
				- NewsService.dart
					I faced an issue for converting data to map.
				- NYT_Service.dart
					I used dio for receiving the data.
		- util
			Here I have some constant definitions or functions necessary for me to provide easy controls.
			
	- model
		I create models here for be able to receive the data from the api.
	
	- view
		All the view files are in this folder.
	
	- widget
		I put my general widget files in here.
		-EmptyDataWidget is using for: if there is no list item to show in the screen.
		-PrimaryWidget is for customizing the header.
		-quickAlert is for every alert in the project.

in the Views -> NewsListView.dart
	 I usually get connect with the related 'controller' in here and it pulls the data from related 'service'.
	 in this project I had some trouble to convert data to my model's map. Error was:
	 type '_InternalLinkedHashMap<String, dynamic>' is not a subtype of type 'List<dynamic>' in type cast
	 
in the Views -> testListView.dart
	 I tried to connect with api but again faced with the issue for converting data.
	
in the Views -> DashboardView.dart
	 This view shows the news list.
     I got data from NYT_Service.dart to show news list. I used scrollController for
	 showing next page but this time I couldnt convert the futureList to normal list.
	 
in the Views -> NewsDetailView.dart
	 This view takes model as parameter and shows the detail of its.
	 
*postscript
Because of the cant converting data as properly I couldn't show you how exactly i create projects 
but i didn't want to erase them so you could examine them too.  As you can see I'm facing some issues 
but want to improve myself in a peacefull working area.


     
	 