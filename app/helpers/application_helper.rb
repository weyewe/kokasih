module ApplicationHelper
  include Rails.application.routes.url_helpers
  
  ACTIVE = 'active'
  
  
  SUPER_USER_PROCESS_LIST = {
    :header_title => "SUPER USER",
    :processes => [
     {
       :title => "Create Office",
       :destination_link => "new_office_url",
       :conditions => [
         {
           :controller => "offices", 
           :action => "new"
         }
       ]

     },
     {
       :title => "Create Branch Manager",
       :destination_link => "new_branch_manager_url",
       :conditions => [
         {
           :controller => "users", 
           :action => "new_branch_manager"
          }
         ]
       }
      ]
    }
    
    
  
  MANAGER_PROCESS_LIST = {
    :header_title => "Manager",
    :processes => [
     {
       :title => "Create Employee",
       :destination_link => "new_employee_url",
       :conditions => [
         {
           :controller => "users", 
           :action => "new_employee"
         }
       ]

     },
     {
       :title => "All Employees",
       :destination_link => "all_employees_url",
       :conditions => [
         {
           :controller => "users", 
           :action => "all_employees"
           }, {
             :controller => "users", 
             :action => "edit_employee"
           }
         ]
       }
      ]
    }
    
  LOAN_CREATOR_PROCESS_LIST =   {
      :header_title => "Loan Creator",
      :processes => [
          {
            :title => "Create Loan",
            :destination_link => "search_client_url",
            :conditions => [
              {
                :controller => "loans", 
                :action => "search_client"
              },{
                :controller => "loans",
                :action => "new"
              }
            ]

          },
          {
              :title => "Create Client",
              :destination_link => "new_client_url",
              :conditions => [
                {
                  :controller => "clients", 
                  :action => "new"
                  }
                ]
          },  
          {
              :title => "Approve Proposed Client",
              :destination_link => "#",
              :conditions => [
                {
                  :controller => "#", 
                  :action => "#"
                  }
                ]
          },
          {
            :title => "All Loans",
            :destination_link => "all_loans_url",
            :conditions => [
              {
                :controller => "loans", 
                :action => "all_loans"
                }
            ]
          },
          {
            :title => "All Clients",
            :destination_link => "all_clients_url",
            :conditions => [
              {
                :controller => "clients", 
                :action => "all_clients"
                }
             ]
          }
        ]
      }
  
  DEBT_COLLECTOR_PROCESS_LIST =     {
        :header_title => "Team Lapangan",
        :processes => [
            {
              :title => "Create Payment",
              :destination_link => "search_client_for_payment_url",
              :conditions => [
                {
                  :controller => "payments", 
                  :action => "search_client"
                },
                {
                  :controller => "loans",
                  :action => "index"
                },
                {
                  :controller => "payments",
                  :action => "new_loan_payment"
                }
              ]

            },
            {
                :title => "Approved Payments",
                :destination_link => '#',
                :conditions => [
                  {
                    :controller => '#', 
                    :action => '#'
                    }
                  ]
            },  
            {
              :title => "Pending Approval",
              :destination_link => '#',
              :conditions => [
                {
                  :controller => "#", 
                  :action => '#'
                  }
                ]
            },
            {
              :title => "Not Approved",
              :destination_link => '#',
              :conditions => [
                {
                  :controller => '#', 
                  :action => '#'
                  }
                ]
            },
            {
              :title => "Propose Client",
              :destination_link => '#',
              :conditions => [
                {
                  :controller => '#', 
                  :action => '#'
                  }
                ]
            }
          ]
        }
        
  CASHIER_PROCESS_LIST =       {
          :header_title => "Cashier",
          :processes => [
              {
                :title => "Approve Payment",
                :destination_link => '#',
                :conditions => [
                  {
                    :controller => '#', 
                    :action => '#'
                  }
                ]

              },
              {
                  :title => "Pending Approval",
                  :destination_link => '#',
                  :conditions => [
                    {
                      :controller => '#', 
                      :action => '#'
                      }
                    ]
              },  
              {
                :title => "View Debt Collector",
                :destination_link => '#',
                :conditions => [
                  {
                    :controller => "#", 
                    :action => '#'
                    }
                  ]
              },
              {
                :title => "All Approved",
                :destination_link => '#',
                :conditions => [
                  {
                    :controller => '#', 
                    :action => '#'
                    }
                  ]
              },
              {
                :title => "All Unapproved",
                :destination_link => '#',
                :conditions => [
                  {
                    :controller => '#', 
                    :action => '#'
                    }
                  ]
              }
            ]
          }
     

  MASTER_DATA_PROCESS_LIST =       {
          :header_title => "Master Data",
          :processes => [
              {
                :title => "Location Data",
                :destination_link => 'location_master_data_url',
                :conditions => [
                  {
                    :controller => 'master_data', 
                    :action => 'location_master_data'
                  }
                ]

              },
              {
                  :title => "New Location Data",
                  :destination_link => 'new_location_master_data_url',
                  :conditions => [
                    {
                      :controller => 'master_data', 
                      :action => 'new_location_master_data'
                      }
                    ]
              }
            ]
          }
          
  def extract_url( some_url )
    if some_url == '#'
      return '#'
    end
    
    eval( some_url ) 
  end


  #######################################################
  #####
  #####     Create Process Nav
  #####
  #######################################################
  
  def get_process_nav( symbol, params)
    # create_process_nav(ADMIN_PROCESS_LIST, params )
    
    if symbol == :super_user
      return create_process_nav(SUPER_USER_PROCESS_LIST, params )
    end
    
    if symbol == :manager
      return create_process_nav(MANAGER_PROCESS_LIST, params )
    end
    
    if symbol == :loan_creator
      return create_process_nav(LOAN_CREATOR_PROCESS_LIST, params )
    end
    
    if symbol == :debt_collector
      return create_process_nav(DEBT_COLLECTOR_PROCESS_LIST, params )
    end
    
    if symbol == :cashier
      return create_process_nav(CASHIER_PROCESS_LIST, params )
    end
    
    if symbol == :master_data
      return create_process_nav(MASTER_DATA_PROCESS_LIST, params )
    end
    
  end
  
  
  def create_process_nav( process_list, params )
    result = ""
    result << "<ul class='nav nav-list'>"
    result << "<li class='nav-header'>  "  + 
                process_list[:header_title] + 
                "</li>"
    
    puts "Done with printing the header title\n"*10            
    
    process_list[:processes].each do |process|
      result << create_process_entry( process, params )
    end
    
    result << "</ul>"
    
    
    puts "The result is #{result}\n\n"*10
    return result
  end
  
  
  def create_process_entry( process, params )
    is_active = is_process_active?( process[:conditions], params)
    puts "The is active value is #{is_active}\n"*10
    
    process_entry = ""
    process_entry << "<li class='#{is_active}'>" + 
                      link_to( process[:title] , extract_url( process[:destination_link] )    )
    
    return process_entry
  end
  
  def is_process_active?( active_conditions, params  )
    active_conditions.each do |condition|
      if condition[:controller] == params[:controller] &&
        condition[:action] == params[:action]
        return ACTIVE
      end

    end

    return ""
  end
  
  
  
  
  
  #######################################################
  #####
  #####     Create Breadcrumb
  #####
  #######################################################
  
  def create_breadcrumb_nav( breadcrumb_list, params )
    result = ""
    result << "<ul class='breadcrumb'>"
    
    # some processsing here 
    element_array = []
    
    
    
    # end of processing
    
    
    result << "</ul>"
  end
  
  
  
  #######################################################
  #####
  #####     AppWide functions, create_guide 
  #####
  #######################################################
  
  def create_guide(title, description)
    result = ""
    result << "<div class='explanation-unit'>"
    result << "<h1>#{title}</h1>"
    result << "<p>#{description}</p>"
    result << "</div>"
  end
  

  
  
  
  
  
  
end
