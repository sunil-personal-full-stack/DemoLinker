class UsersController < ApplicationController
    layout :resolve_layout


    def resolve_layout
     case action_name
     when  "create","login","show","verification" ,"show_profile","show_home","edit"
      "user"
     when "logout"
      "application"
    
     else
      "application"
     end
    end

    
    
    def verification

       @user_id=session[:user_id]
       
       @scode = VerifCode.find_by_sql("select id , code from verif_codes where user_id=\""+@user_id.to_s+"\"")
       @dcode
       @scode.each do |e|
            @dcode=e.code
        end
       
       
       @code=params.require(:verification).permit(:code)
      
       @code2
       @code.each do |f|
           @code2=f
       end
       @icode=@code2.at(1)
       
       if @dcode!= @icode
            session[:role]='user'
            flash[:notice] = "Entered Verification Code is Wrong"
            render action: 'show'

           else
              render action: 'show_home'
             
           end
    end

    def show_home
      @role=session[:role]
      puts @role
      
        if session[:role].nil?
            
            
           redirect_to action: 'new'
         end
    end

    def show_profile
        @id=session[:user_id]
         @users=User.find_by_sql("select firstName , lastName , email , password from users where id="+@id.to_s)
         puts "lllllllllllllllllllllllllllllllllllllllllllllllllllllllllsssssssssssssssssssssssssllllllllllllllllllssssssssssssssssssooooooooooooooooooooooo" 
    
          puts @users
          @firstName
          @lastName
          @email
          @users.each do |us|
             @firstName=us.firstName
             @lastName=us.lastName
             @email=us.email
           end
          

    end  
    def logout
      reset_session
    
    end
     
    def new
      
    end


    def demo
    end

    def edit
      @id=session[:user_id]
      @users=User.find(@id)
      
      @users.update(params.require(:user).permit(:firstName,:lastName,:email))

      else flash[:notice] = "User Details are updated"

      render action:'show_profile'
    end

    def show
        
    end


    def login
         
         @email=params[:login][:email]
         @pass=params[:login][:password]
         @users=User.find_by_sql("select id from users where email=\""+@email.to_s+"\" and password=\""+@pass.to_s+"\"")
         
         puts @users
         @id
         @users.each do |u|
          @id=u.id
         end
         @user_id=@id
         if @id!=nil
          session[:user_id]=@id
          session[:role]="user"
          render action: 'show_home'
        else
          redirect_to action: 'logout'
          end
    end


    def create
           @email=params.require(:user).permit(:email)
           @result=User.find_by @email
          if @result==nil

            
          
            
               @user = User.new(users_params)
               @user.verif='notVerified'
            
               if @user.save
                session[:user_id]=@user.id
               @r=Random.new

               @rnumber=@r.rand(10000...60000)
               @code=VerifCode.new
               @code.user_id=@user.id
               @code.code=@rnumber
               if @code.save

                   @demo=UserMailer.welcome_email(@user,@rnumber).deliver_now!
                   puts 'Hello............................................................................................'
                   puts @demo
                   render action:'show'
               else 
                  render action:'new'
               end
             else

             end
            else flash[:notice] = "User exit already"
            
           
           end
      end


 private

  def users_params
    params.require(:user).permit(:firstName,:lastName,:email,:password)
  end
end