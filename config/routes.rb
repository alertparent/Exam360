Exam360::Application.routes.draw do
    
  devise_for :users
  
  devise_scope :user do
    # get "sign_in", to: "devise/sessions#new"
    match 'login' => "user_sessions#new",      :as => :login,:via=> :all
    match 'logout' => "user_sessions#destroy", :as => :logout,:via=> :all
    resources :users
    get "users/show"

    get "users/edit"


    get "home/index"

    get "user_sessions/new"
  end
  
   
  
  # resources :user_sessions
 
  
  
  get "errors/not_found"  
    
  get "subcategory/index"
  get "subcategory/list"
  get "subcategory/show"
  post "subcategory/save"
  post "subcategory/update"
  get "subcategory/edit"
  get "subcategory/new"
  get "subcategory/destroy"
  post "subcategory/destroy"  
  
  
  #resources :article
  get "article/index"
  get "article/show"
  get "article/list"
  get "article/comment"
  post "article/comment"
  get "article/new"
  post "article/save"
  get "article/edit"
  post "article/update"
  get "article/news"
  get "article/destroy"
  post "article/destroy"
    get "article/delete"
  post "article/delete"
  match '/getBlogcategory' => 'article#getBlogcategory',:via=> :all
  match '/thumbsUp' => 'article#thumbsUp',:via=> :all
  match '/thumbsDown' => 'article#thumbsDown',:via=> :all
  match '/delete_comment' => 'article#delete_comment',:via=> :all
  
  get "blog_category/index"
  get "blog_category/list"
  get "blog_category/show"
  post "blog_category/save"
  post "blog_category/update"
  get "blog_category/edit"
  get "blog_category/destroy"
  post "blog_category/destroy"
  get "blog_category/new"
  match '/subcategory' => 'blog_category#subcategory',:via=> :all
  match '/subcategory_article' => 'blog_category#subcategory_article',:via=> :all 
  match '/blog' => 'blog_category#blog' ,:via=> :all
  match '/categoryArticle' => 'blog_category#categoryArticle',:via=> :all

  
  
  # resources :users do
  #    get :autocomplete_user_name, :on => :collection
  #   end
  
  resources :folders
  get "folders/index"
  get "folders/new"
  get "folders/create"
  post "folders/create"
  get "assets/destroy"
  post "assets/destroy"  
  match "browse/:folder_id" => "folders#browse", :as => "browse"  ,:via=> :all
  match "browse/:folder_id/new_folder" => "folders#new", :as => "new_sub_folder"    ,:via=> :all
  match "browse/:folder_id/new_file" => "assets#new", :as => "new_sub_file",:via=> :all
  match "browse/:folder_id/rename" => "folders#edit", :as => "rename_folder",:via=> :all
  match '/getName' => 'folders#getName',:via=> :all
  match '/unshareFolder' => 'folders#unshareFolder',:via=> :all
  
  resources :assets 
  get "assets/index"
  get "assets/new"
  get "assets/create"
  post "assets/create"
  get "assets/destroy"
  post "assets/destroy"
match "assets/get/:id" => "assets#get", :as => "download"  ,:via=> :all
  match "assets/share" => "assets#share",:via=> :all
  match "assets/unshare" => "assets#unshare",:via=> :all
  match '/lock' => 'assets#lock',:via=> :all
  match '/unlock' => 'assets#unlock'  ,:via=> :all
  
  
  
  
resources :aboutus
resources :clientinfo
  resources :images 

  #get "images/index"
  #get "images/new"
  match '/view_aboutus' => 'home#view_aboutus',:via=> :all
  match '/view_clients' => 'home#view_clients',:via=> :all
  match '/view_features' => 'home#view_features',:via=> :all
  match '/view_modules' => 'home#view_modules',:via=> :all
  match '/view_contactus' => 'home#view_contactus',:via=> :all
  
  match '/deleteUsersubject' => 'users#deleteUsersubject',:via=> :all

match '/clientImage' => 'images#clientImage',:via=> :all
match '/createClientimage' => 'images#createClientimage',:via=> :all

  get "/questions/question_type_listing"
  post "/questions/new"
  resources :questions do
        member do
          get "delete_option"
      post "delete_option"
                get "delete_match_option"
      post "delete_match_option"
                      get "delete_matrix_row"
      post "delete_matrix_row"
                      get "delete_matrix_column"
      post "delete_matrix_column"
      get "delete_hrcl_option"
      post "delete_hrcl_option"
      
            get "saveImage"
      post "saveImage"
      
    end
  end
    #post "questions/publish_unpublish"
  #get "questions/publish_unpublish"
  match '/publish_unpublish' => 'questions#publish_unpublish',:via=> :all
  match '/unpublish' => 'questions#unpublish',:via=> :all
  match '/share' => 'questions#share' ,:via=> :all

  match '/saveImage' => 'questions#saveImage',:via=> :all
   match '/sharewithCategory' => 'questions#sharewithCategory',:via=> :all
  match'/checkMark' => 'questions#checkMark',:via=> :all
   match'/viewQuestion' => 'questions#viewQuestion',:via=> :all
   
  get "subjects/add_subject_category"
  resources :subjects 
  
  post "subjects/cs"
  
  resources :categories
  resources :category_titles
  resources :emails  
    
  post "attend_exams/confirm_exam"
  get "attend_exams/confirm_exam"
  post "attend_exams/reject_exam"
  get "attend_exams/reject_exam"
  resources :attend_exams
  get "attend_exams/index"
  match '/examination' => 'attend_exams#examination',:via=> :all
  match '/instruction' => 'attend_exams#instruction',:via=> :all
  match '/evaluation' => 'attend_exams#evaluation',:via=> :all
  match '/evaluation' => 'attend_exams#ramdomizeQuestions',:via=> :all
   match '/examComplete' => 'attend_exams#examComplete',:via=> :all
   match '/calculateScore' => 'attend_exams#calculateScore',:via=> :all
   match '/windowClose' => 'attend_exams#windowClose',:via=> :all
   
   
   match 'welcome/examinee_dashboard' => 'welcome#examinee_dashboard',:via=> :all
  #get "exams/attend_exam"
  #post "exams/attend_exam"

  resources :exams 
  #  member do
      #get "exams/index"
  #  end
  #end
  match '/scheduleExam' => 'exams#scheduleExam',:via=> :all
  match '/selectQuestion' => 'exams#selectQuestion',:via=> :all
  match '/assignQustions' => 'exams#assignQustions',:via=> :all
  match '/selectExaminee' => 'exams#selectExaminee',:via=> :all
  match '/assignExaminees' => 'exams#assignExaminees',:via=> :all
  match '/previewExam' => 'exams#previewExam',:via=> :all
  match '/deleteExamQuestion' => 'exams#deleteExamQuestion',:via=> :all
  match '/deleteExamUser' => 'exams#deleteExamUser',:via=> :all
 match '/getMark' => 'exams#getMark',:via=> :all
 match '/assignExam' => 'exams#assignExam',:via=> :all
  match '/groupExam' => 'exams#groupExam',:via=> :all
 match '/updateMark' => 'exams#updateMark',:via=> :all
  match '/examtype' => 'exams#examtype',:via=> :all
   match '/create_examtype' => 'exams#create_examtype',:via=> :all
   match '/listExamtypes' => 'exams#listExamtypes',:via=> :all
  match '/editExamtype' => 'exams#editExamtype' ,:via=> :all
   match '/deleteExamtype' => 'exams#deleteExamtype' ,:via=> :all
   match '/updateExamtype' => 'exams#updateExamtype' ,:via=> :all
match '/getExam' => 'exams#getExam',:via=> :all
 match '/showEvaluationtype' => 'exams#showEvaluationtype',:via=> :all
 match '/hideEvaluationtype' => 'exams#hideEvaluationtype',:via=> :all
 match '/evaluate' => 'exams#evaluate',:via=> :all
 match '/getExamQuestions' => 'exams#getExamQuestions',:via=> :all
 match '/manualEvaluation' => 'exams#manualEvaluation',:via=> :all
 match '/finishEvaluation' => 'exams#finishEvaluation',:via=> :all
 match '/getCategoryexams' => 'exams#getCategoryexams',:via=> :all
 match '/assignEvaluator' => 'exams#assignEvaluator',:via=> :all
  match '/getEvaluator' => 'exams#getEvaluator',:via=> :all
  match '/evaluator' => 'exams#evaluator',:via=> :all
  match '/delete_evaluator' => 'exams#delete_evaluator' ,:via=> :all
  
 match '/completedExams' => 'attend_exams#completedExams',:via=> :all
 match '/pendingExams' => 'attend_exams#pendingExams',:via=> :all
 
 
  
  match '/updateCategory' => 'category_titles#updateCategory',:via=> :all
  match '/deleteCategory' => 'category_titles#deleteCategory',:via=> :all
  
  get "settings/index"
  post "settings/update"
  
  get "feedback/index"
  match '/assign' => 'feedback#assign',:via=> :all
  match '/unassign' => 'feedback#unassign',:via=> :all
  match '/viewFeedback' => 'feedback#viewFeedback',:via=> :all
  match '/submitFeedback' => 'feedback#submitFeedback',:via=> :all
  match '/viewfeedbackResponse' => 'feedback#viewfeedbackResponse',:via=> :all
  match '/feedbackResponse' => 'feedback#feedbackResponse',:via=> :all
    

  get "reports/index"
  
  get "results/index"
  match '/usersResult' => 'results#usersResult',:via=> :all
  match '/resultIndex' => 'results#index',:via=> :all
  match '/viewUserResult' => 'results#viewUserResult',:via=> :all
  match '/groupResult' => 'results#groupResult',:via=> :all
  match '/examsResult' => 'results#examsResult',:via=> :all
  match '/viewExamResult' => 'results#viewExamResult',:via=> :all
  match '/departmentResult' => 'results#departmentResult',:via=> :all
  match '/viewDepartmentResult' => 'results#viewDepartmentResult',:via=> :all
  
  #get "examination/index"
  
 # get "reports/generateDepartmentReport"
  
  match '/userReport' => 'reports#userReport',:via=> :all
  match '/viewuserReport' => 'reports#viewuserReport',:via=> :all
 match '/examReport' => 'reports#examReport',:via=> :all
match '/viewexamReport' => 'reports#viewexamReport',:via=> :all
match '/generateUser' => 'reports#generateUser',:via=> :all
match '/userSubjectwise' => 'reports#userSubjectwise',:via=> :all
match '/generateExamReport' => 'reports#generateExamReport',:via=> :all
match '/departmentReport' => 'reports#departmentReport',:via=> :all
match '/viewDepartmentReport' => 'reports#viewDepartmentReport',:via=> :all
match '/generateDepartmentReport' => 'reports#generateDepartmentReport',:via=> :all
match '/viewDepartmentReportgraph' => 'reports#viewDepartmentReportgraph',:via=> :all
match '/highLevel' => 'reports#highLevel',:via=> :all
match '/reportYear' => 'reports#reportYear',:via=> :all
match '/overall' => 'reports#overall',:via=> :all
match '/specificDepartment' => 'reports#specificDepartment',:via=> :all
match '/departmentDetailed' => 'reports#departmentDetailed',:via=> :all
match '/semesterDetailed' => 'reports#semesterDetailed',:via=> :all
match '/pass_fail' => 'reports#pass_fail',:via=> :all
match '/generatePassfail' => 'reports#generatePassfail',:via=> :all
match '/fetchExam' => 'reports#fetchExam',:via=> :all

match '/listCategories' => 'categories#listCategories',:via=> :all
match '/delete_category' => 'categories#delete_category',:via=> :all



  get "questions/index"

  get "subjects/index"


 # resources :settings
  resources :temporary_examinee
  #get "temporary_examinee/new"
  #get "temporary_examinee/create"
  #post "temporary_examinee/create"


  #get "user_registration/new"
  resources :user_registration

  
  #resources :welcome
  get "welcome/index"
  get "welcome/admin_dashboard"
  get "welcome/examiner_dashboard"
  get "welcome/qsetter_dashboard"
  get "welcome/examinee_dashboard"
  post "welcome/confirm_registration"
  get "welcome/confirm_registration"
  post "welcome/reject_registration"
  get "welcome/reject_registration"
  get "welcome/user_management"
  get "welcome/workflow"
  
  get "passwords/new"

  #get "passwords/forgot"
  match 'groupUser' => 'users#groupUser',:via=> :all
  match 'createGroup' => 'users#createGroup',:via=> :all
  get "user_sessions/new"

  get "users/new"
  get "users/generate_temporary_password"
  post "users/generate_temporary_password"
  match 'activate_inactivate' => 'users#activate_inactivate',:via=> :all
    match 'activate' => 'users#activate',:via=> :all
      match 'inactivate' => 'users#inactivate',:via=> :all
  #match 'users/tempexaminee' => 'users#new'

  
    
  #get "password_resets/new"
  resources :password_resets do
    member do
      get 'confirmEmail'
      get 'setPassword'
      get 'savePassword'
      post 'savePassword'
      get 'verifyPassword'      
    end
  end
  get "password_resets/edit"


 # post "password_resets/edit"

  get    'verify/:id'       => 'user_verifications#index'
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"
    root :to => 'home#index'
    resources :home
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
