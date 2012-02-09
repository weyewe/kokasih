module PaymentsHelper
  ACTIVE = 'active'
  
  #######################################################
  ##### =>  For breadcrumb in create payment section
  #######################################################
  
  def get_create_payment_nav_active_state( section , params )

    if section == CREATE_PAYMENT_NAV[:search_client]  
      if in_search_client_tab?(params)
        return ACTIVE
      end
    end

    if section == CREATE_PAYMENT_NAV[:select_loan]  
      if  in_select_loan_tab?(params)
        return ACTIVE
      end
    end
    
    if section == CREATE_PAYMENT_NAV[:create_payment]  
      if  in_create_payment_tab?(params)
        return ACTIVE
      end
    end

  end
  
  
  #######################################################
  ##### =>  For breadcrumb in create payment section
  #######################################################
  
  def in_search_client_tab?(params)
    if  params[:controller] == "payments" && params[:action] == "search_client"  
      return true
    end

    return false
  end
  
  def in_select_loan_tab?(params)
    if  params[:controller] == "loans" && params[:action] == "index"  
      return true
    end

    return false
  end
  
  def in_create_payment_tab?(params)
    if  params[:controller] == "payments" && params[:action] == "new_loan_payment"  
      return true
    end

    return false
  end
  
end
