<?php

class testTask extends Task_Base {

    // 示例
    public function testAction() {
        printf("task start at %s\n", date('Y-m-d H:i:s'));

        printf("hello world\n");

        printf("task end at %s\n", date('Y-m-d H:i:s'));
    }



}
