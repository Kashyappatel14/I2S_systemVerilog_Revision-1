class constant_data_stream_mono_left_test extends i2s_transaction ;
  i2s_config cfg;
  constraint left_data_c {left_data == {`size{1'b1}};}

    function new(i2s_config cfg);
      super.new(cfg);
    endfunction 


endclass:constant_data_stream_mono_left_test 

program test_tb(i2s_intf intf);  
   i2s_config #(`size) cfg=new;


  i2s_env env;
  initial begin
    constant_data_stream_mono_left_test seq_h=new(cfg);

    cfg.update_config(.repeat_gen(2),.config_ration(RATION16),.word_len(`size),.slv_word_len(WLEN16),.mode_master(TX),.mode_slave(RX),.chnl_mode(MONO_LEFT),.ws_mode(LEFT_JUSTIFIED),.complement(NORMAL));
  
    env=new(intf,cfg);
   env.m_agent.gen.tx1=seq_h;
    $display("[---------------RUNNING TEST:CONSTANT DATA STREAM ON MONO_LEFT MODE-------------------]");
    env.run();
    
  end
endprogram:test_tb
