Joey
====
Joey(<a href="http://github.com/waseem/joey">http://github.com/waseem/joey</a>) provides object wrappers for nodes in the Facebook OpenGraph. It also provides wrappers for the data returned from facebook REST api. This gem depends upon Koala(<a href="http://github.com/arsduo/koala">http://github.com/arsduo/koala</a>).

This discussion(http://groups.google.com/group/koala-users/browse_thread/thread/650be4f3377aef48) sums up the motivation to create Joey and what it intends to accomplish.

Wrappers
----

Koala is a lightweight Ruby library which provides an interface to access Facebook Open Graph and REST API.

Facebook servers return data in the form of Json or XML. When you use Koala to make requests to the Graph, it converts the returned Json into ready to be used Ruby hashes. e.g.

    koala_client = Koala::Facebook::GraphAndRestAPI.new(access_token)
    # http://graph.facebook.com/me
    me = koala_client.get_object('me')
    # => {"name"=>"Phuddu Bandar", "timezone"=>5.5, "gender"=>"male", "id"=>"100000654222309", "birthday"=>"12/01/1986", "last_name"=>"Bandar", "updated_time"=>"2010-01-10T16:35:06+0000", "hometown"=>{"name"=>nil, "id"=>nil}, "link"=>"http://www.facebook.com/profile.php?id=100000654222309", "email"=>"phuddu.bandar@gmail.com", "first_name"=>"Phuddu"}

    me['name'] # => 'Phuddu Bandar'
    me['gender'] # => 'male'
    me['hometown']['name'] # => nil

Above when tried with joey returns a Joey::User object. We can access different information associated with a user using accessor methods instead of hash keys.

    koala_client = Koala::Facebook::GraphAndRestAPI.new(access_token)
    # http://graph.facebook.com/me
    me = koala_client.me
    # => <#Joey::User about=nil about_me=nil activities=nil birthday="12/01/1986" birthday_date=nil books=nil email="phuddu.bandar@gmail.com" first_name="Phuddu" gender="male" id="100000654222309" interests=nil is_app_user=nil is_blocked=nil last_name="Bandar" link="http://www.facebook.com/profile.php?id=100000654222309" locale=nil meeting_for=nil meeting_sex=nil middle_name=nil movies=nil music=nil name="Phuddu Bandar" notes_count=nil pic=nil pic_big=nil pic_big_with_logo=nil pic_small=nil pic_small_with_logo=nil pic_square=nil pic_square_with_logo=nil pic_with_logo=nil political=nil profile_blurb=nil profile_update_time=nil profile_url=nil quotes=nil relationship_status=nil religion=nil sex=nil significant_other_id=nil timezone=5.5 tv=nil uid=nil updated_time="2010-01-10T16:35:06+0000" username=nil verified=nil wall_count=nil website=nil>

    me.name # => 'Phuddu Bandar'
    me.gender # => 'male'
    me.hometown.name # => nil


The main advantage of creating wrapper classes for different nodes in the Graph is that one can add custom methods to different objects. e.g.

In Open Graph there is no method to know if a user has given some particular extended permission to your application. However in old REST api there is <a href="http://developers.facebook.com/docs/reference/rest/users.hasAppPermission">users.hasAppPermission</a> for the same.

If we use plain Koala, we can implement it in following way:

    !koala_client.rest_call('users.hasAppPermission', :ext_perm => 'email').zero? # => true or false

In Joey, call to users.hasAppPermission is sheilded behind a Joey::User#has_app_permission?(ext_perm)

    me = koala_client.me
    me.has_app_permission?(:email) # => true or false

A more complex use cases arises when someone intends to add an application specific methods to different nodes. e.g.

An application intends to know if a user has given his proxy email while giving the email extended permission. One can include a module with custom methods.

    module FacebookUser

      def self.included(base)
        base.extend(ClassMethods)
      end

      module ClassMethods
      end

      def has_proxy_email?
        if self.has_app_permission?(:email)
          return self.email =~ /@proxymail\.facebooo\.come/
        else
          return true
        end
      end
    end

and somewhere when you intialize your application like 'config/initializers/joey_patch.rb'

    Joey::User.send(:include, FacebookUser)

Now one can do

    me = koala_client.me
    me.has_proxy_email? # => true or false
