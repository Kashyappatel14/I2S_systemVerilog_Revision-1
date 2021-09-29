

// Revision: 1
//-------------------------------------------------------------------------------


program test_tb(i2s_intf intf);  
  i2s_config#(`size) cfg=new;
  i2s_env env;

  initial begin
    
    assert(cfg.randomize() with {mode_master == TX; complement == TWOS_COMPL; chnl_mode == STEREO; repeat_gen inside {[5:10]};}) begin
      `print_info("TEST_CASE","display","config randomization done",0,`verbo_lev);
    end
    else begin
      `print_info("TEST_CASE","error","config_randomization fail",0,`verbo_lev);
    end
    env=new(intf,cfg);

      $display("[---------------RUNNING TEST: MASTER_TX_STEREO_TWOS_DATA_TRANSFER-------------------]");
    env.run();
    
  end
endprogram:test_tb


