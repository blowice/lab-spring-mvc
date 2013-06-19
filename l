[33mcommit d046d020dbc23d58a8442f2964e8eef77774cd95[m
Author: jack.hao <blowice@hotmail.com>
Date:   Fri Jun 7 01:10:37 2013 +1000

    implement maven -> tomcat auto deployment

:100644 100644 bc46438... 47fc244... M	.idea/workspace.xml
:100644 100644 476559b... ba26a2c... M	README.md
:100644 100644 61bdeab... ffc8b7b... M	lab-spring-mvc.iml
:100644 100644 6e7e091... 85e3825... M	pom.xml
:100644 000000 ff847f5... 0000000... D	src/main/resources/jdbc.properties
:100644 000000 193b670... 0000000... D	src/main/resources/mvc-dispatcher-servlet.xml
:100644 000000 e423e0a... 0000000... D	src/main/resources/spring-security.xml
:000000 100644 0000000... ff847f5... A	src/main/webapp/WEB-INF/jdbc.properties
:000000 100644 0000000... 193b670... A	src/main/webapp/WEB-INF/mvc-dispatcher-servlet.xml
:000000 100644 0000000... e423e0a... A	src/main/webapp/WEB-INF/spring-security.xml
:100644 100644 a65efc9... 024c409... M	src/main/webapp/WEB-INF/web.xml
:000000 100644 0000000... ff847f5... A	target/lab-spring-mvc-20130606b/WEB-INF/jdbc.properties
:000000 100644 0000000... 193b670... A	target/lab-spring-mvc-20130606b/WEB-INF/mvc-dispatcher-servlet.xml
:000000 100644 0000000... e423e0a... A	target/lab-spring-mvc-20130606b/WEB-INF/spring-security.xml
:100644 100644 a65efc9... 024c409... M	target/lab-spring-mvc-20130606b/WEB-INF/web.xml
:100644 100644 3142f45... 0a43591... M	target/maven-archiver/pom.properties
:100644 100644 3eb661f... 143692d... M	target/surefire-reports/TEST-TestORM.xml
:100644 100644 df5f91e... 1437afa... M	target/war/work/webapp-cache.xml

[33mcommit 0e15efebfd834e43bea8b25e1c3235e06b84a256[m
Author: jack.hao <blowice@hotmail.com>
Date:   Thu Jun 6 23:28:29 2013 +1000

    implement maven directory structure. modify pom file

:000000 100644 0000000... cbd446b... A	.idea/artifacts/lab_spring_mvc_war.xml
:000000 100644 0000000... a61641a... A	.idea/artifacts/lab_spring_mvc_war_exploded.xml
:100644 000000 91b2399... 0000000... D	.idea/artifacts/web_war_exploded.xml
:100644 100644 217af47... b61beb6... M	.idea/compiler.xml
:000000 100644 0000000... b8d93d8... A	.idea/libraries/Maven__antlr_antlr_2_7_7.xml
:000000 100644 0000000... 30ff5cb... A	.idea/libraries/Maven__aopalliance_aopalliance_1_0.xml
:000000 100644 0000000... b770f56... A	.idea/libraries/Maven__commons_logging_commons_logging_1_1_1.xml
:000000 100644 0000000... 14681ee... A	.idea/libraries/Maven__dom4j_dom4j_1_6_1.xml
:000000 100644 0000000... 40b1672... A	.idea/libraries/Maven__jstl_jstl_1_2.xml
:000000 100644 0000000... f33320d... A	.idea/libraries/Maven__junit_junit_4_11.xml
:000000 100644 0000000... f58bbc1... A	.idea/libraries/Maven__org_hamcrest_hamcrest_core_1_3.xml
:000000 100644 0000000... 1f82649... A	.idea/libraries/Maven__org_hibernate_common_hibernate_commons_annotations_4_0_2_Final.xml
:000000 100644 0000000... a4aa4dc... A	.idea/libraries/Maven__org_hibernate_hibernate_core_4_2_2_Final.xml
:000000 100644 0000000... 352de38... A	.idea/libraries/Maven__org_hibernate_javax_persistence_hibernate_jpa_2_0_api_1_0_1_Final.xml
:000000 100644 0000000... e27b8ed... A	.idea/libraries/Maven__org_javassist_javassist_3_15_0_GA.xml
:000000 100644 0000000... 9885bce... A	.idea/libraries/Maven__org_jboss_logging_jboss_logging_3_1_0_GA.xml
:000000 100644 0000000... ed44624... A	.idea/libraries/Maven__org_jboss_spec_javax_transaction_jboss_transaction_api_1_1_spec_1_0_1_Final.xml
:000000 100644 0000000... a034884... A	.idea/libraries/Maven__org_springframework_security_spring_security_config_3_1_4_RELEASE.xml
:000000 100644 0000000... 8267572... A	.idea/libraries/Maven__org_springframework_security_spring_security_core_3_1_4_RELEASE.xml
:000000 100644 0000000... f5844aa... A	.idea/libraries/Maven__org_springframework_security_spring_security_web_3_1_4_RELEASE.xml
:000000 100644 0000000... 48ecb4e... A	.idea/libraries/Maven__org_springframework_spring_aop_3_2_2_RELEASE.xml
:000000 100644 0000000... 68610c2... A	.idea/libraries/Maven__org_springframework_spring_beans_3_2_2_RELEASE.xml
:000000 100644 0000000... b1fbd94... A	.idea/libraries/Maven__org_springframework_spring_context_3_2_2_RELEASE.xml
:000000 100644 0000000... 4ce94f8... A	.idea/libraries/Maven__org_springframework_spring_core_3_2_2_RELEASE.xml
:000000 100644 0000000... a545973... A	.idea/libraries/Maven__org_springframework_spring_expression_3_2_2_RELEASE.xml
:000000 100644 0000000... e7d6132... A	.idea/libraries/Maven__org_springframework_spring_jdbc_3_2_2_RELEASE.xml
:000000 100644 0000000... daee99f... A	.idea/libraries/Maven__org_springframework_spring_orm_3_2_2_RELEASE.xml
:000000 100644 0000000... 2c0e348... A	.idea/libraries/Maven__org_springframework_spring_test_3_2_2_RELEASE.xml
:000000 100644 0000000... d64cb7e... A	.idea/libraries/Maven__org_springframework_spring_tx_3_2_2_RELEASE.xml
:000000 100644 0000000... c369292... A	.idea/libraries/Maven__org_springframework_spring_web_3_2_2_RELEASE.xml
:000000 100644 0000000... 221256e... A	.idea/libraries/Maven__org_springframework_spring_webmvc_3_2_2_RELEASE.xml
:000000 100644 0000000... 3e8bb21... A	.idea/libraries/Maven__postgresql_postgresql_9_1_901_jdbc4.xml
:000000 100644 0000000... 8d7bb73... A	.idea/libraries/Maven__taglibs_standard_1_1_2.xml
:100644 000000 2a357e0... 0000000... D	.idea/libraries/hibernate_4_2_2.xml
:100644 000000 bfb2085... 0000000... D	.idea/libraries/project_lib.xml
:100644 000000 7fa5955... 0000000... D	.idea/libraries/spring_3_2_2.xml
:100644 000000 54a96b0... 0000000... D	.idea/libraries/spring_mvc_3_2_2_RELEASE.xml
:100644 000000 02d895e... 0000000... D	.idea/libraries/spring_security_3_1_4.xml
:100644 100644 0a25b9b... b04d7d2... M	.idea/misc.xml
:100644 100644 8599555... bc46438... M	.idea/workspace.xml
:100644 100644 bd3471f... 476559b... M	README.md
:100644 100644 5a1d7f8... 61bdeab... M	lab-spring-mvc.iml
:000000 100644 0000000... a597655... A	out/artifacts/web_war_exploded/WEB-INF/classes/jack/hao/lab/spring/mvc/controller/HelloController.java
:000000 100644 0000000... 801da52... A	out/artifacts/web_war_exploded/WEB-INF/classes/jack/hao/lab/spring/mvc/dao/CountryDAOImpl.java
:000000 100644 0000000... d4be004... A	out/artifacts/web_war_exploded/WEB-INF/classes/jack/hao/lab/spring/mvc/dao/CountryDao.java
:000000 100644 0000000... cb1773b... A	out/artifacts/web_war_exploded/WEB-INF/classes/jack/hao/lab/spring/mvc/domain/Country.java
:000000 100644 0000000... 6c4551f... A	out/artifacts/web_war_exploded/WEB-INF/classes/jack/hao/lab/spring/mvc/service/CountryService.java
:000000 100644 0000000... 31b0f96... A	out/artifacts/web_war_exploded/WEB-INF/classes/jack/hao/lab/spring/mvc/service/CountryServiceImpl.java
:000000 100644 0000000... 6e7e091... A	pom.xml
:100644 000000 a597655... 0000000... D	src/jack/hao/lab/spring/mvc/controller/HelloController.java
:100644 000000 d4be004... 0000000... D	src/jack/hao/lab/spring/mvc/dao/CountryDAO.java
:100644 000000 801da52... 0000000... D	src/jack/hao/lab/spring/mvc/dao/CountryDAOImpl.java
:100644 000000 cb1773b... 0000000... D	src/jack/hao/lab/spring/mvc/domain/Country.java
:100644 000000 6c4551f... 0000000... D	src/jack/hao/lab/spring/mvc/service/CountryService.java
:100644 000000 31b0f96... 0000000... D	src/jack/hao/lab/spring/mvc/service/CountryServiceImpl.java
:000000 100644 0000000... 15a5886... A	src/main/java/mvc/controller/HelloController.java
:000000 100644 0000000... cd80972... A	src/main/java/mvc/dao/CountryDAOImpl.java
:000000 100644 0000000... 259431a... A	src/main/java/mvc/dao/CountryDao.java
:000000 100644 0000000... 200e7c6... A	src/main/java/mvc/domain/Country.java
:000000 100644 0000000... a5c0024... A	src/main/java/mvc/service/CountryService.java
:000000 100644 0000000... d302829... A	src/main/java/mvc/service/CountryServiceImpl.java
:000000 100644 0000000... 842e1d7... A	src/main/java/test/TestORM.java
:000000 100644 0000000... ff847f5... A	src/main/resources/jdbc.properties
:000000 100644 0000000... 193b670... A	src/main/resources/mvc-dispatcher-servlet.xml
:000000 100644 0000000... e423e0a... A	src/main/resources/spring-security.xml
:000000 100644 0000000... 71ed5df... A	src/main/webapp/WEB-INF/jsp/country_list.jsp
:000000 100644 0000000... c0773c5... A	src/main/webapp/WEB-INF/jsp/login.jsp
:000000 100644 0000000... a65efc9... A	src/main/webapp/WEB-INF/web.xml
:000000 100644 0000000... e3dc128... A	src/main/webapp/css/demo_page.css
:000000 100644 0000000... 194fa76... A	src/main/webapp/css/demo_table.css
:000000 100644 0000000... 5421e1d... A	src/main/webapp/index.jsp
:000000 100644 0000000... 82f48c5... A	src/main/webapp/js/jquery.dataTables.js
:000000 100644 0000000... e1b9803... A	src/main/webapp/js/jquery.dataTables.min.js
:000000 100644 0000000... 3227413... A	src/main/webapp/js/jquery.js
:000000 100644 0000000... d71409d... A	src/test/java/TestORM.java
:000000 100644 0000000... ff847f5... A	target/classes/jdbc.properties
:000000 100644 0000000... 193b670... A	target/classes/mvc-dispatcher-servlet.xml
:000000 100644 0000000... e423e0a... A	target/classes/spring-security.xml
:000000 100644 0000000... ff847f5... A	target/lab-spring-mvc-20130606b/WEB-INF/classes/jdbc.properties
:000000 100644 0000000... 193b670... A	target/lab-spring-mvc-20130606b/WEB-INF/classes/mvc-dispatcher-servlet.xml
:000000 100644 0000000... e423e0a... A	target/lab-spring-mvc-20130606b/WEB-INF/classes/spring-security.xml
:000000 100644 0000000... 71ed5df... A	target/lab-spring-mvc-20130606b/WEB-INF/jsp/country_list.jsp
:000000 100644 0000000... c0773c5... A	target/lab-spring-mvc-20130606b/WEB-INF/jsp/login.jsp
:000000 100644 0000000... a65efc9... A	target/lab-spring-mvc-20130606b/WEB-INF/web.xml
:000000 100644 0000000... e3dc128... A	target/lab-spring-mvc-20130606b/css/demo_page.css
:000000 100644 0000000... 194fa76... A	target/lab-spring-mvc-20130606b/css/demo_table.css
:000000 100644 0000000... 5421e1d... A	target/lab-spring-mvc-20130606b/index.jsp
:000000 100644 0000000... 82f48c5... A	target/lab-spring-mvc-20130606b/js/jquery.dataTables.js
:000000 100644 0000000... e1b9803... A	target/lab-spring-mvc-20130606b/js/jquery.dataTables.min.js
:000000 100644 0000000... 3227413... A	target/lab-spring-mvc-20130606b/js/jquery.js
:000000 100644 0000000... 3142f45... A	target/maven-archiver/pom.properties
:000000 100644 0000000... 3eb661f... A	target/surefire-reports/TEST-TestORM.xml
:000000 100644 0000000... c96ff20... A	target/surefire-reports/TestORM.txt
:000000 100644 0000000... df5f91e... A	target/war/work/webapp-cache.xml
:100644 000000 ff847f5... 0000000... D	web/WEB-INF/jdbc.properties
:100644 000000 71ed5df... 0000000... D	web/WEB-INF/jsp/country_list.jsp
:100644 000000 c0773c5... 0000000... D	web/WEB-INF/jsp/login.jsp
:100644 000000 2e71fe6... 0000000... D	web/WEB-INF/mvc-dispatcher-servlet.xml
:100644 000000 e423e0a... 0000000... D	web/WEB-INF/spring-security.xml
:100644 000000 a65efc9... 0000000... D	web/WEB-INF/web.xml
:100644 000000 e3dc128... 0000000... D	web/css/demo_page.css
:100644 000000 194fa76... 0000000... D	web/css/demo_table.css
:100644 000000 5421e1d... 0000000... D	web/index.jsp
:100644 000000 82f48c5... 0000000... D	web/js/jquery.dataTables.js
:100644 000000 e1b9803... 0000000... D	web/js/jquery.dataTables.min.js
:100644 000000 3227413... 0000000... D	web/js/jquery.js

[33mcommit 0f689ad358d323908613ca5079fad7b530f605fa[m
Author: jack.hao <blowice@hotmail.com>
Date:   Mon May 27 15:08:04 2013 +1000

    minor commit(cont.). test the end line character in README.md

:100644 100644 1792fc1... 8599555... M	.idea/workspace.xml
:100644 100644 dfa3e94... bd3471f... M	README.md

[33mcommit 9ecbfeebd6aafd5328abbe3c521f2f8a5df0d773[m
Author: jack.hao <blowice@hotmail.com>
Date:   Mon May 27 15:06:22 2013 +1000

    minor commit. test the end line character in README.md

:100644 100644 6f1728a... 1792fc1... M	.idea/workspace.xml
:100644 100644 be3845c... dfa3e94... M	README.md
:100644 100644 5db86f7... e423e0a... M	out/artifacts/web_war_exploded/WEB-INF/spring-security.xml
:100644 100644 b526b5c... a65efc9... M	out/artifacts/web_war_exploded/WEB-INF/web.xml
:100644 100644 5db86f7... e423e0a... M	web/WEB-INF/spring-security.xml
:100644 100644 b526b5c... a65efc9... M	web/WEB-INF/web.xml

[33mcommit 780aee7bd22fc8fc632230eb39dc2493ed424865[m
Author: jack.hao <blowice@hotmail.com>
Date:   Mon May 27 14:41:10 2013 +1000

    setup spring security rules and store user credential in db

:100644 100644 c645636... 6f1728a... M	.idea/workspace.xml
:100644 100644 b409fd7... be3845c... M	README.md
:100644 100644 406e442... 5a1d7f8... M	lab-spring-mvc.iml
:000000 100644 0000000... ff847f5... A	out/artifacts/web_war_exploded/WEB-INF/jdbc.properties
:000000 100644 0000000... c0773c5... A	out/artifacts/web_war_exploded/WEB-INF/jsp/login.jsp
:100644 100644 62c611c... 2e71fe6... M	out/artifacts/web_war_exploded/WEB-INF/mvc-dispatcher-servlet.xml
:000000 100644 0000000... 5db86f7... A	out/artifacts/web_war_exploded/WEB-INF/spring-security.xml
:100644 100644 23a7b20... b526b5c... M	out/artifacts/web_war_exploded/WEB-INF/web.xml
:100644 100644 4ae3426... a597655... M	src/jack/hao/lab/spring/mvc/controller/HelloController.java
:100644 100644 2c7ddf0... cb1773b... M	src/jack/hao/lab/spring/mvc/domain/Country.java
:100644 000000 ff847f5... 0000000... D	src/jdbc.properties
:000000 100644 0000000... ff847f5... A	web/WEB-INF/jdbc.properties
:000000 100644 0000000... c0773c5... A	web/WEB-INF/jsp/login.jsp
:100644 100644 62c611c... 2e71fe6... M	web/WEB-INF/mvc-dispatcher-servlet.xml
:000000 100644 0000000... 5db86f7... A	web/WEB-INF/spring-security.xml
:100644 100644 23a7b20... b526b5c... M	web/WEB-INF/web.xml
