-- MySQL dump 10.13  Distrib 5.6.24, for Win32 (x86)
--
-- Host: localhost    Database: wechat
-- ------------------------------------------------------
-- Server version	5.6.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `act_evt_log`
--

DROP TABLE IF EXISTS `act_evt_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_evt_log` (
  `LOG_NR_` bigint(20) NOT NULL AUTO_INCREMENT,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_STAMP_` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DATA_` longblob,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  `IS_PROCESSED_` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`LOG_NR_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_evt_log`
--

LOCK TABLES `act_evt_log` WRITE;
/*!40000 ALTER TABLE `act_evt_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_evt_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ge_bytearray`
--

DROP TABLE IF EXISTS `act_ge_bytearray`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ge_bytearray` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTES_` longblob,
  `GENERATED_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_BYTEARR_DEPL` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_BYTEARR_DEPL` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ge_bytearray`
--

LOCK TABLES `act_ge_bytearray` WRITE;
/*!40000 ALTER TABLE `act_ge_bytearray` DISABLE KEYS */;
INSERT INTO `act_ge_bytearray` VALUES ('307b0f7a57534bb9ac12d0f804537788',1,'test_audit.bpmn20.xml','d6403c84f1a743c1ab89e888519bd87d','<?xml version=\'1.0\' encoding=\'UTF-8\'?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\">\r\n  <process id=\"test_audit\" name=\"æµç¨‹å®¡æ‰¹æµ‹è¯•æµç¨‹\" isExecutable=\"true\">\r\n    <startEvent id=\"start\" name=\"å¯åŠ¨å®¡æ‰¹\" activiti:initiator=\"apply\" activiti:formKey=\"/oa/testAudit/form\"/>\r\n    <endEvent id=\"end\" name=\"ç»“æŸå®¡æ‰¹\"/>\r\n    <userTask id=\"modify\" name=\"å‘˜å·¥è–ªé…¬æ¡£çº§ä¿®æ”¹\" activiti:assignee=\"${apply}\"/>\r\n    <userTask id=\"audit\" name=\"è–ªé…¬ä¸»ç®¡åˆå®¡\" activiti:assignee=\"thinkgem\"/>\r\n    <exclusiveGateway id=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\"/>\r\n    <userTask id=\"audit2\" name=\"é›†å›¢äººåŠ›èµ„æºéƒ¨éƒ¨é•¿å®¡æ ¸\" activiti:assignee=\"thinkgem\"/>\r\n    <exclusiveGateway id=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\"/>\r\n    <sequenceFlow id=\"sid-EF2F51BB-1D99-4F0B-ACF2-B6C1300A7D2B\" sourceRef=\"audit2\" targetRef=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\"/>\r\n    <userTask id=\"audit3\" name=\"é›†å›¢äººåŠ›èµ„æºéƒ¨åˆ†ç®¡é¢†å¯¼å®¡æ ¸\" activiti:assignee=\"thinkgem\"/>\r\n    <exclusiveGateway id=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\"/>\r\n    <sequenceFlow id=\"sid-3DBCD661-5720-4480-8156-748BE0275FEF\" sourceRef=\"audit3\" targetRef=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\"/>\r\n    <userTask id=\"audit4\" name=\"é›†å›¢æ€»ç»ç†å®¡æ‰¹\" activiti:assignee=\"thinkgem\"/>\r\n    <exclusiveGateway id=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\"/>\r\n    <userTask id=\"apply_end\" name=\"è–ªé…¬æ¡£çº§å…‘ç°\" activiti:assignee=\"thinkgem\"/>\r\n    <sequenceFlow id=\"sid-02DB2AD9-1332-4198-AC8D-22A35169D15C\" sourceRef=\"audit4\" targetRef=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\"/>\r\n    <sequenceFlow id=\"sid-2AB7C01A-50EE-4AAC-8C8F-F6E1935B3DA7\" sourceRef=\"audit\" targetRef=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\"/>\r\n    <sequenceFlow id=\"sid-36E50C8B-6C7C-4968-B02D-EBAA425BF4BE\" sourceRef=\"start\" targetRef=\"audit\"/>\r\n    <sequenceFlow id=\"sid-7D723190-1432-411D-A4A4-774225E54CD9\" name=\"æ˜¯\" sourceRef=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\" targetRef=\"apply_end\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-D44CAD43-0271-4920-A524-9B8533E52550\" name=\"æ˜¯\" sourceRef=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\" targetRef=\"audit4\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-53258502-43EE-4DE8-B1A4-DBD11922B8AF\" name=\"å¦\" sourceRef=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\" targetRef=\"modify\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <exclusiveGateway id=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\"/>\r\n    <sequenceFlow id=\"sid-163DBC60-DBC9-438B-971A-67738FB7715A\" sourceRef=\"modify\" targetRef=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\"/>\r\n    <sequenceFlow id=\"sid-72258A41-203E-428C-B71D-CA3506252D73\" name=\"æ˜¯\" sourceRef=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\" targetRef=\"audit2\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-8448EF4A-B62E-4899-ABC2-0E2DB2AE6838\" name=\"é‡æ–°ç”³è¯·\" sourceRef=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\" targetRef=\"audit\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-A7589084-4623-4FEA-A774-00A70DDC1D20\" name=\"æ˜¯\" sourceRef=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\" targetRef=\"audit3\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-FA618636-3708-4D0C-8514-29A4BB8BC926\" name=\"å¦\" sourceRef=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\" targetRef=\"modify\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-1525BFF4-3E9D-4D8A-BF80-1F63AFE16289\" name=\"å¦\" sourceRef=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\" targetRef=\"modify\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-35CC8C6C-1067-4398-991C-CCF955115965\" name=\"å¦\" sourceRef=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\" targetRef=\"modify\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-BDB0AAB2-7E50-4D35-80EE-CE0BECDD9F57\" sourceRef=\"apply_end\" targetRef=\"end\"/>\r\n    <sequenceFlow id=\"sid-44AFB9C1-4057-4C48-B1F2-1EC897A52CB7\" name=\"é”€æ¯\" sourceRef=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\" targetRef=\"end\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\r\n    </sequenceFlow>\r\n  </process>\r\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_test_audit\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"test_audit\" id=\"BPMNPlane_test_audit\">\r\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"BPMNShape_start\">\r\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"30.0\" y=\"245.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"BPMNShape_end\">\r\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"975.0\" y=\"356.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"modify\" id=\"BPMNShape_modify\">\r\n        <omgdc:Bounds height=\"58.0\" width=\"102.0\" x=\"209.0\" y=\"135.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"audit\" id=\"BPMNShape_audit\">\r\n        <omgdc:Bounds height=\"57.0\" width=\"96.0\" x=\"105.0\" y=\"231.5\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\" id=\"BPMNShape_sid-C28BB5F6-013D-4570-B432-61B380C1F46F\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"240.0\" y=\"240.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"audit2\" id=\"BPMNShape_audit2\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"210.0\" y=\"330.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\" id=\"BPMNShape_sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"345.0\" y=\"350.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"audit3\" id=\"BPMNShape_audit3\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"420.0\" y=\"330.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\" id=\"BPMNShape_sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"555.0\" y=\"350.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"audit4\" id=\"BPMNShape_audit4\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"630.0\" y=\"330.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\" id=\"BPMNShape_sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"765.0\" y=\"350.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"apply_end\" id=\"BPMNShape_apply_end\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"840.0\" y=\"330.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\" id=\"BPMNShape_sid-5FED02D6-C388-48C6-870E-097DB2131EA0\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"240.0\" y=\"45.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-3DBCD661-5720-4480-8156-748BE0275FEF\" id=\"BPMNEdge_sid-3DBCD661-5720-4480-8156-748BE0275FEF\">\r\n        <omgdi:waypoint x=\"520.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"555.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-44AFB9C1-4057-4C48-B1F2-1EC897A52CB7\" id=\"BPMNEdge_sid-44AFB9C1-4057-4C48-B1F2-1EC897A52CB7\">\r\n        <omgdi:waypoint x=\"280.0\" y=\"65.0\"/>\r\n        <omgdi:waypoint x=\"989.0\" y=\"65.0\"/>\r\n        <omgdi:waypoint x=\"989.0\" y=\"356.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-8448EF4A-B62E-4899-ABC2-0E2DB2AE6838\" id=\"BPMNEdge_sid-8448EF4A-B62E-4899-ABC2-0E2DB2AE6838\">\r\n        <omgdi:waypoint x=\"240.0\" y=\"65.0\"/>\r\n        <omgdi:waypoint x=\"153.0\" y=\"65.0\"/>\r\n        <omgdi:waypoint x=\"153.0\" y=\"231.5\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-A7589084-4623-4FEA-A774-00A70DDC1D20\" id=\"BPMNEdge_sid-A7589084-4623-4FEA-A774-00A70DDC1D20\">\r\n        <omgdi:waypoint x=\"385.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"420.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-35CC8C6C-1067-4398-991C-CCF955115965\" id=\"BPMNEdge_sid-35CC8C6C-1067-4398-991C-CCF955115965\">\r\n        <omgdi:waypoint x=\"785.0\" y=\"350.0\"/>\r\n        <omgdi:waypoint x=\"785.0\" y=\"164.0\"/>\r\n        <omgdi:waypoint x=\"311.0\" y=\"164.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-EF2F51BB-1D99-4F0B-ACF2-B6C1300A7D2B\" id=\"BPMNEdge_sid-EF2F51BB-1D99-4F0B-ACF2-B6C1300A7D2B\">\r\n        <omgdi:waypoint x=\"310.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"345.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-7D723190-1432-411D-A4A4-774225E54CD9\" id=\"BPMNEdge_sid-7D723190-1432-411D-A4A4-774225E54CD9\">\r\n        <omgdi:waypoint x=\"805.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"840.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-2AB7C01A-50EE-4AAC-8C8F-F6E1935B3DA7\" id=\"BPMNEdge_sid-2AB7C01A-50EE-4AAC-8C8F-F6E1935B3DA7\">\r\n        <omgdi:waypoint x=\"201.0\" y=\"260.0\"/>\r\n        <omgdi:waypoint x=\"240.0\" y=\"260.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-D44CAD43-0271-4920-A524-9B8533E52550\" id=\"BPMNEdge_sid-D44CAD43-0271-4920-A524-9B8533E52550\">\r\n        <omgdi:waypoint x=\"595.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"630.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FA618636-3708-4D0C-8514-29A4BB8BC926\" id=\"BPMNEdge_sid-FA618636-3708-4D0C-8514-29A4BB8BC926\">\r\n        <omgdi:waypoint x=\"365.0\" y=\"350.0\"/>\r\n        <omgdi:waypoint x=\"365.0\" y=\"164.0\"/>\r\n        <omgdi:waypoint x=\"311.0\" y=\"164.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-02DB2AD9-1332-4198-AC8D-22A35169D15C\" id=\"BPMNEdge_sid-02DB2AD9-1332-4198-AC8D-22A35169D15C\">\r\n        <omgdi:waypoint x=\"730.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"765.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-36E50C8B-6C7C-4968-B02D-EBAA425BF4BE\" id=\"BPMNEdge_sid-36E50C8B-6C7C-4968-B02D-EBAA425BF4BE\">\r\n        <omgdi:waypoint x=\"60.0\" y=\"260.0\"/>\r\n        <omgdi:waypoint x=\"105.0\" y=\"260.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-53258502-43EE-4DE8-B1A4-DBD11922B8AF\" id=\"BPMNEdge_sid-53258502-43EE-4DE8-B1A4-DBD11922B8AF\">\r\n        <omgdi:waypoint x=\"260.0\" y=\"240.0\"/>\r\n        <omgdi:waypoint x=\"260.0\" y=\"193.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-163DBC60-DBC9-438B-971A-67738FB7715A\" id=\"BPMNEdge_sid-163DBC60-DBC9-438B-971A-67738FB7715A\">\r\n        <omgdi:waypoint x=\"260.0\" y=\"135.0\"/>\r\n        <omgdi:waypoint x=\"260.0\" y=\"85.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-BDB0AAB2-7E50-4D35-80EE-CE0BECDD9F57\" id=\"BPMNEdge_sid-BDB0AAB2-7E50-4D35-80EE-CE0BECDD9F57\">\r\n        <omgdi:waypoint x=\"940.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"975.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-1525BFF4-3E9D-4D8A-BF80-1F63AFE16289\" id=\"BPMNEdge_sid-1525BFF4-3E9D-4D8A-BF80-1F63AFE16289\">\r\n        <omgdi:waypoint x=\"575.0\" y=\"350.0\"/>\r\n        <omgdi:waypoint x=\"575.0\" y=\"164.0\"/>\r\n        <omgdi:waypoint x=\"311.0\" y=\"164.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-72258A41-203E-428C-B71D-CA3506252D73\" id=\"BPMNEdge_sid-72258A41-203E-428C-B71D-CA3506252D73\">\r\n        <omgdi:waypoint x=\"260.0\" y=\"280.0\"/>\r\n        <omgdi:waypoint x=\"260.0\" y=\"330.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>',0),('899c24530acd4ec8ac1aa159a045234b',1,'test_audit.png','d6403c84f1a743c1ab89e888519bd87d','‰PNG\r\n\Z\n\0\0\0\rIHDR\0\0Ü\0\0|\0\0\0=Ó³Ú\0\0SâIDATxÚíİ|TõÿÿS Š·¿h©Ë²ülêeÕ®Z1†‹4–X â­K]Š¬RVV©\"ÔZ/À\"\Z1…c\nÄ€‘†šD.IácŒ1f¥˜EÄÒcã÷>ß9ç03™I2I˜ÌL^ÏÇãóÈ\\Î\\2çû>s>sÎœ1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0€î§/\0\0\0\0\0+Á,eı\0\0\0\0\0 Ş¬/ÌJ²şá%\0\0\0\0 sšm»É–-ÜŸÑt\0\0\0\0ĞyÍvk—\0\0\0\0€V$´ÒTÛ×ón\0\0\0\0\0‚l¶[k¦ÙÒ\r\0\0\0\0@ÅÁm¹vz\0\0\0\0\0ºm³=¦·«£é\0\0\0\0 óšíÎº=\0\0\0\0\0Q§µ¤…ú~\0\0\0\0\0ˆšf»³vgK7\0\0\0\0 Ûó=àÙ÷ÌºÓúßÛq 5\0\0\0\0@·o¶Çx4ÍËÌRÖß¶6İnGÓ\r\0\0\0\0èöÍ¶¸ÓjšUM·g³m×DëùN7\0\0\0\0 ÛÔûk[jºıMŸêgz¾Ó\r\0\0\0\0è6ÍvBM´¿¦»­Í¶oÓÍîå\0\0\0\0€¨ÓÖ¦·µ¦;ØfÛóñ?3ØÒ\r\0\0\0\0ˆÂf»­Ín ¦»G;›mßé\0\0\0\0tÛf»¥¦»ªÍvGŸ\0\0\0\0\0a££[”ı5İi¶}›n¾Ó\r\0\0\0\0],Î¬ÇÍÊ6k§Õ¬)ªM•ÔÁ×^v#÷İ²]e]ŞIÌŠ¢(Š¢(*ÊªÎ¬j³rÍzÆpohêE;‡pÔ×\Z¤ŸšUdÖ³Æ™u±Y}xyÚ¤µ£’·¦¥-Ümùî@ØÂ\r\0\0€h$}Ê Ã½‡©ô2[Í:h¸76õãåA¸˜l5Ú‹Íº€—£C¤¹­3NÌw¸ÛÓtón\0\0\0t\'ÌJ¶Ögòr +Éîo˜•o¸·d£óšî`¶(úé/G)¦éæ(å\0\0\0è®dËw¹áşšìé¼è\nÒlg|ÏáD6İ­5»­ıÎvk¿ÓÈƒßá\0\0@÷ÖÇêw²éyj²y>ï„jmskÍ¶ÑÎ¦ÛŞ­}³\0\0\0\04İzK÷#¼9@š|g›İÈO¼@[ºÛÚlÛtÛG³\r\0\0\0¸Éîå²÷\'RCHÈü’yB&Áh¾{÷Fğ¿³í¯éèó8|g\0\0\0hNúŸ$^„‚lİæhä¡oº=¤æÙ<·¥Ù6Z¹?ı\0\0\0&G/—Ÿã+µ8¡â÷ïl#ô|w/—fy¢üO}ùŞ®£¿ÿ\r\0\0\0t[YgÆ‰ö”YsxÂ¦éî(»«\0\0\0hNú gxp\"É!ñ9 Vt4İİ¼\0\0\0ÑLÖ›syp\"í48:y8èènàìF\0\0\0GV^ÍË€Iš´>¼aÕt»…š¤\0\0\0Á“>¨—\'’â%+ÁîÎnä\0\0\0\0ı`èä&zˆáşDïà\0\0\0ôC`€¡¬f:¡…ë?£Ù\0\0\0è‡À\0Cğméf7r\0\0\0€~0trÓM³\r\0\0\0Ğ†Nnº“h¶\0\0\0ú!0ÀĞ¹¦YóŠŸş\0\0\0è‡À\0C\'Ê²æU/^\n\0\0\0€~0t8³\\[¸\0\0\0ú!0ÀĞ©2­ù$µ“—\0\0\0 7Ä8¾uÛ.š\0\0\0Ğ†Êòi¶í­Ü|—\0\0\0 íäoë¶]ãxy\0\0\0\0ú!0ÀĞ>Ùšm©\"^\0\0\0€~0¯¥­Û|—\0\0\0 í”ÕJ³ÍË\0\0\0ú!0ÀÀ¼\0\0\0XÇÌ+\0\0\0€ul€Æ¼\0\0\0À:6``^\0\0\0¬cƒæ\0\0\0À:6À\0c^\0\0\0`00¯\0\0\0\0Ö±Á\0ó\n\0\0\0``€1¯\0\0\0\0°\r˜W\0\0\0\0ëØ`€y\0\0\0°\r0À˜W\0\0\0\0XÇÌ+\0\0\0€ul0ÀÀ¼\0\0\0XÇ`Ì+\0\0\0\0¬cƒæ\0\0\0À:6``^\0\0\0¬c0æ\0\0\0\0Ö±Á\0ó\n\0\0\0`00¯\0\0\0\0Ö±ó\n\0\0\0\0ëØ`€y\0\0\0°\r˜W\0\0\0\0ëØ\0Œy\0\0\0°\r0À˜W¼\0\0\0\0ëØ`€y\0\0\0°\r˜W\0\0\0\0ëØ\0Œy\0\0\0€ul0ÀÀ¼\0\0\0XÇÌ+\0\0\0€ul€Æ¼\0\0\0À:6``^\0\0\0¬cƒæ\0\0\0À:6À\0c^\0\0\0`00¯\0\0\0\0Ö±Á\0ó\n\0\0\0``€1¯\0\0\0\0°\r˜W\0\0\0\0ëØ`€y\0\0\0°\r0À˜W\0\0\0\0XÇ,¤ÿ°R½SRRfNœ8qolllCïŞ½•õ:PP={öüîüóÏÿløğáÍ¿#‰\0\0\0è‡À\0ë–-[vÏÈ‘#ëcbbÔœ9³U~~jhøÊìÁ¿£:©äõ,**T‰‰Ï©6öïß¯ùÒ_LÔ\0\0\0@?X”JM}e}¿~ıTRÒÊåj4›Ã&*•œ¼HõéÓç«SO=õ&â\0\0\0ú!0À¢°Ù¾à‚TQÑv³	ü–\nq•——©¾}ûşÃœcˆ\0\0\0è‡À\0‹Ë–-½G¶lm3›?—W-]ú’\Z3&A\Zu½ºşúkÔ\rñ#Uò¢¤fÓQ¯òò½ê”SNùÂ`÷r\0\0\0ĞÿœR½G¼¦>)éyóä7^µbùR5úç£Ô­·ŒÕ5vÌ*>şZ5tèj‘nº¿¡:¹çŞ«W¯<b\0\0\0ú!0À\"\\JÊÂ™11?R.W½Ùğ5zUÂ¨xİhßpÃH§~ö³ëÔğaWšMwl³é©Î©³Ï>ûSsÖÄ=\0\0\0ĞÁ&Nœ°wÎœ\'ÍFïëf5bxœzaÁ|•õV†Jy1IoÙ¾jÄP}¹œv¹¾ô{;ªc5mÚ½;ÍY“Hô\0\0\0@?X‹ÒŸŸc6z\rÍêî»\'ªƒıTmİòÊşÓµêÕTµ>sú¸úCõ?S\'«o¿ıÒïí¨Õ»ïæ0gÍN¢\0\0\0ú!0À\"XïŞ½UCÃçf£Wß¬›õ*.Ú¢voU»w•è’Ó;vlW=ößÛP/™æ¬q=\0\0\0ĞáÿŸR_6+—ëïjÖ¬™jÊo&©’’BUşŞ]»víPÓîûo5ãÁûÔ×_î÷¶TÇ‹\0\0\0è‡À\0‹Š†»Î«\Z?WëÖ½¦bcªª?ªTN¿Ï«JK‹ÕË/U¯¯NU\r\rŸ5»=ÕñbÁ\0\0\0ú!0À¢¢áş‡Sß}wL½µ!]\r\Z«jª«Ô{e»Uîæ*óÍ?ª´×WªÔW^2›ñ4½{ù•W^®ÒÓW¨o¿ıÂë>¨6\0\0\0Ğ\r÷1§¶nÙ¤k[šì¼¼ÍêÍŒtİh¯X¾D½¼x‘JzáYõÌ¼§õÔ¿´P]{Íµñí5^÷Au¼X°\0\0€~°¨h¸ÿîÔc³~§D.õ²ÔÅº–¼œ¬’-PÏ\'ÎSÿ;÷IõÄïQ3güV=ùÄ£f³©~7ó~¯û :^,Ø\0\0\0@?XT4Ü_8%\r·üØí·İ¬ŞH{U7ÚÒ|?;š;ç	õÜ³suÓ-Mø˜Ñ	jsÎÛVÃıÕ‰Å‚\r\0\0\0ôC`€EEÃ}Ô©½{·©G™¡~yû8İPË®äş*.nˆúõ„ñzkwié»^÷Au¼X°\0\0€~°¨h¸?÷*×7S_~ù©J|îi•0ê:5bø•jèĞ+TÜ•CÔP³Ñ¾æêáêûïQÇıEOë{{ªãÅ‚\r\0\0\0ôC`€EEÃ}„\n³bÁ\0\0\0ú!0À¢¢áşŒ\n³bÁ\0\0\0ú!0À¢¢á>L…Y±`\0\0\0ı`QÑpÿ\n³bÁ\0\0\0ú!0À¢¢á>D…Y±`\0\0\0ı`QÑp¤Â¬X°\0\0€~°¨h¸PaVmwO˜Õ@<\0\0@?XX7Ü¥Â¬ZwÒhm]ÏÂ\0\0\0ôC`€…wÃ]ë·äº…g«ÄÄÇuíÛW¬/+)Ùğ6Á–Ü_ffªs:\'çu}ººz[ÀÛ”—¿£öìÉñz¾ÏKÎÏš5­ÙcÍŸ?KŸ>th×uUU[ôõG”7{¼ÚÚÒf—UVèékj\nõù\r–«3Î8½İÿ»¿ëZi´i¸\0\0@?Xø7ÜŸú­ã\r¡÷eYY+¼.»ùæ5yò¯Ì†¼H—œ¾÷Ş;ór›¹sr¦ïÙ³§JNã\\çnæİ§ËËÿl6Îo«3Ï<CO[]½U?İ`nÜøª\Z?şjÂ„[ôi¹¬¶v§ş+Óz>Ï•+_pNïß¿Cÿ­¬ÌWkõiyLÏégÏ©}_ÿÏr~Ê”ÿtÃ¾/Ïéü·^ç/¿ü\'zúÑ£¯×ÏÏ¾îÆGªéÓ£ïÜsÿEÍ˜1ÅlğßÕ·©¨ÈøÚ[ógáŞu\\(\0\0\0€~°ğm¸÷û-»©LL|L—İoÙ².àm¤.¼ğÇ*6öÒ§±ï_šÏÃ‡÷èó”ê¿yyéúºúú*}^[ÎŸrJoİ|o6Ãw˜ÍíJ}ù±cX[¸³Ô¡C»Ë—,™¯ŸKFÆµ`Áïõeuu•úoAÁ\ZçyH.—55íÓ«ªÜ[¯åù¬Y³XmØ°ÌëyÛÓeg¯R¥¥Unnš~Îr^şû±ııÏò?ÈëwÎ9?PÃ†]®Ÿ«ı|÷ï/özmÿ[´i¸\0\0@?Xä4ÜiVee›Ô=Ùª±ñc¯ª­İ¡D·±ëxÃíÿú‚‚?ªk¯S99¯©””9ê´ÓN5›æ\nuòÉ\'©;î¸Élbß6›ÚOœéíæR¦­«û@¥§¿¨<O-\\ø”¾\\¦w7ÓxİF¦—Ó.W*/ß¬/KM}N?VEÅŸõu‡íÒ—§¥-Rƒ_ ›yûööıÊë §íû^µ*ÉÚú¿Tİ|ó(çqìç“›ûzÀÿ]¶ÜËõ2¼ÆöcÉ}yN×†F›¢(Š¢(wÕ™µÇ¬l³1+Ş¬^¬ÂôC`€…IÃ½¯Y-Y2O]tÑ¿ª-[Ö¨Õ«ÿ ®»n˜š=ûA}^nSXø¦ßÛI¹îK^/eè-Éî-Ëóæ=¤Ùcí^¬¯—óÓ&%=¡øg³©®PÉÉOëË¦N`}Wû^½›º=}ccµó&\\]] ²²–©Wx•\\·mÛ:=}vö«ª¦f‹×ãz+øõmûö=[o–Ë-SkÖ¤è†úô»U|ü}ÙO~2H}¾oy.òá\\nß—L\'×ÅÄP—\\2ØlºW{=–\\çûúXóç³¾5Âsw³™5Æ¬ÇÍÊ5ë YIfõcÑ#i¶’#€÷#€~°¨j¸?iVrù]wıRŸNK[¨·B{^—™¹Äïí¤.¼0Æj¸›_W_ÿõ]çåú~d‹¶œ.+Ëvî÷¬³ÎÔ»\\ïß_è<4©éºÙ–¦UšÛU«^°¾‹½Íù+Ó§¦Î·¶Lo´\Zëµ~ÿ?û8zt¯õ}êÍú|mm‘óÜìiW¯NÒ§Şå\\&Íø7^«O.[¸ğIİh74|¨ÿOÏÇÊÈXìœ—\rššjœıİõœfÏÏg>½\Z ñ7¬¦AVtîañ´;GÉf}aÖL^€÷#€~°ˆn¸ÿ¯Y¹îÛÓÓ§ßåu]fæË~o\'u¼áö}qñ›úöv#+»rWW»·v»\\ÕÍî_Î/^,»“¿¯(Véé‹Ì¦ıbUSãnV*±¾Ã½Şld?V))³­¤åêÛoØ°T7õ“&İ¦Ënöåú††J§y•é\n×©‹.ºP7éî&<Çjæ·6{}Æ½^İzk‚Ù,oÒÿó‘#»Tvö\nëhë¯zMën¸½_‡ÄÄGõYY©~_ÿ\0óËw‹w¸’-\r²…a­Y§³Ú£rÃ½›,9x?è‡À\0‹Ì†»¦Yú\'ÁPõõï[JK7›Ğ5fC[m6¬ËüŞÆ®ã\r·ÿëkkÕòåÏZ?ÓõÙlç©óÎûjîÜÇv7ÜÇŸKrò“º¡İ·o‹n¸å²ÆÆ­­ÄyÖ.àif½ÙlÚ?²šù>ÏÇ8v¬Ìy^rÿ†>`Z‘ÙHg[ßÚïí¥á¶ÿOy\\ù~öwüBßV®_°`–3­\\ôènuÙeÿ¦fÏ®/—×ÔĞßù^å÷ş[™oöïp&ßŸË²Vr\0´O+GÙßIx?è‡À\0‹Ä†ûc¿uäH©õ³]èó›œ­Á\r\rú²Ã‡KÔM7Åëš2e¼Ù<¾ª·Ú{n}Z*--É:Ùz}CWz»Õ,¿£ZC%ü#çúÌÌÅÎóóÃ†ıÔlôSUFFŠJM}F?†}Ü‡¡wñ^êu›òò?©ÂÂµº	–š4éV]r?î&8Çl‚İMë×ï‡ª¬Ì}´¼¼ÕÎó[¼x¶µõ{‰×kcè°=c6ı•ú¹İ{ïuèP±š7o¦úş÷{éûòœVjÕªçÿQCS^û1}ï?ŠVrdË»ókºeK÷#¼\0ïG\0ı`×pW{UNÎ\nİ¼öïÙtïlv½ÜfÚ´‰Îù††÷›M¨\Z?ĞÓËıËı>¼Ãj8_óºwó|ü|II†>ír}há;KŸojªr¦)(xİë6<ª§÷÷<äúââuúô¾}ú¯|w¼¦&OßÏàÁç;ÓÊc¹?0Èôºı…úºmÛÒÕèÑ×ª[oå÷ñä¹Û—WTd««¯¾B7ò¾÷¿zõ¯û¢1&»ó}jpà\Z £9úŒ¼ôC`€E\\ÃıQDUSÓ‡2M¨K{¦Âq\'®IbqtH29x?è‡À\0‹¸†»Š\n³ŠÂq\'G‹•#ÅòT€ä ºSÃı!f¥ãN¾;—À\"è­äàı ,¢\ZîJ*Ì*JÇİã†{W>\0í7‡¼ôC`€ETÃıf¥ãnŒáşi#\0ËQ./Àû@?XÄ4ÜT˜U”;9:ì)@‡sTÍË\0ğ~Ğ1\r÷ûT˜U”;ù-á:)\09È@?t£†»œ\n³ŠâqÇ G\09ÈĞ\Zî÷¨0+\Zn\0ä G\0y,*\Zî2*ÌŠ†\09È@^À\0‹Š†{/fEÃ\r€ä /`€EEÃ½‡\n³¢á@\0r0À¢¢áŞM…YÑp G\09È`îä“Oú®¡¡ÈlòvQaR_}U¸Ïœ5.ò€ä /`€E°Áƒ|(?‰Ùè•RaRë×?ÿ¶9kv’\'\0ä G\0y,‚]uÕeëæÌ™J£F5vìUiæ¬I$O\0È@\0òX0à±œóËµƒf7<ê“=zT˜³&< G\09È`®ÿ–&%=H³5fÌUKÍY’K\0#€ä°è0èÌ3O«/*ZAÓÛ…•Ÿ¿t½9/šu1y@\0r0À¢Gü9çœıwšî®k¶{ôèQcÎ‡1ä	\09È@^À\0‹Â¦û¤“¾lŞ¼û>ç;İ¡ûÎ¶µùÁnĞl³ÀÈ@\0òtë6¨gÏïåœ~ú©‡§L¹e÷¦M/lh(¤1îÄúê«íûä§¿ähäÖÒä;Û“\'\0ä G\0y¬{¸Ô¬9fm5«Áz¨Î)—áşmùé¯8ò€ä /`€!œeYóª/yÈ\0r0ÀĞ9d+±ËšW	¼ä	 G\0È@^À\0CçÈ4ï®½“—ƒ<ä\09È`è¸!Æñ­Ûváe!O\09@\0ò:&Ëh~P2ÙÊÍw¹É@\0#€¼€†vò·uÛ®q¼<ä	 G\0È@^À\0Cûdz«ˆ—‡<ä\09È`^K[·ù.7yÈ\0r0ÀĞNY­4Û±œ<ä\09È``^1\0#€ä00¯À<È@\0ò0À˜W`ä\09È``^1\0#€ä00¯À<È@\0ò0À˜W`ä\09È``^1\0#€ä00¯À<È@\0ò0À˜W`ä G\0È``^1\0#€ä00¯À<È@\0ò0À˜W`ä G\0È``^1\0#€ä00¯À<È@\0ò0À˜W`ä G\0È``^1\0r€ä00¯À<È@\0ò0À˜W`ä G\0ÈNˆ,k@µT;y™X€y#€äÎ³\\­4Ücx™X€y#€ä^vÍv‘Y½x‰X€y#€äŞ\Zîq¼<,À<È@\0ò´Ÿ¿ïrËw·ÙºÍÂ\0Ì#€ä /@øû.7ßİfa\0æ@\0r d\Zlİfa\0æ@\0r ÓÅy4Ü	¼,À<È@\0òtû»Ülİfa\0æ@\0r \ra€±0\0ó G\09È\"g)Õ;%%eæÄ‰÷ÆÆÆ6ôîİ;ĞÏpQ-TÏ=¿;ÿüó?>|øFóïHFæ@\0#€¼tcË–-»gäÈ‘õ111jÎœÙ*??O54|eöàßQA–¼nEE…*1ñ95pàÀÆşıûï5_â‹Y€y#\0ä /İLjê+ëûõë§’’^P.W£Ù46QXÉÉ‹TŸ>}¾:õÔSoba\0æ@\0#€¼t£fû‚.PEEÛÍæğ[êUyy™êÛ·ï?Œîù»á,˜G\09@\0òÒ½,[¶ôÙ²]T´Íl\n]^µtéKjÌ˜5jÔõêúë¯Q7ÄTÉ‹’šMGµ½ÊË÷ªSN9å£ûí^ÎÂ€y#\0ä /İhî(Õ{äÈkê“’7O~ãU+–/U£>JİzËX]cÇÜ¨âã¯UC‡^¡é¦ûª•˜8ÿó^½zå±0\0ó G\0È@^¢TJÊÂ™11?R.W½Ù6zUÂ¨xİhßpÃH§~ö³ëÔğaWšMwl³é©àêì³ÏşÔœq,À<È\0r—(4qâ„½sæ<i6€_7«ÃãÔæ«¬·2TÊ‹IzËöU#†êËå´Ëõ¥ßÛQm«iÓîİiÎ‚D`ä\09ÈKŠÒŸŸc6€\rÍêî»\'ªƒıTmİòÊşÓµêÕTµ>sú¸úCõ?S\'«o¿ıÒïí¨¶Õ»ïæ0gÁN`ä\09ÈKêİ»·jhøÜl\0ë›Õc³RÅE[Ôâ­j÷®]rzÇíê±Çò{ªí%¯»9\\İd¨%XƒRÇ G\0È@^ºÍRêËfårı]Íš5SMùÍ$URR¨ÊßÛ£k×®jÚ}ÿ­f<xŸúúëÏıŞ–j{u“€Ä›%GeO²ş!v,°r€ä¥›4Üu^ÕØø¹Z·î5ûSUıQ¥zpú}^UZZ¬†\\~©z}uªjhø¬Ùí©¶W7H¼O“-[¸?£éf\r#\0ä /İ¤áş‡Sß}wL½µ!]\r\Z«jª«Ô{e»Uîæ*óÍ?ª´×WªÔW^2›ñ4½{ù•W^®ÒÓW¨o¿ıÂë>¨¶W”Ä·Ùnír°ÀÈ\0r—hk¸9µuË&ı[ÛÒdçåmVof¤ëF{Åò%êåÅ‹TÒÏªgæ=­ ¶ø¥…êÚkF¨o¯ñºªíÅIh¥©¶¯ç;İ,°r€Qš—fİgÖZ³ªÍª³pƒYŸ˜•iÖLkº(n¸ÿîÔc³~§D.õ²ÔÅº–¼œ¬’-PÏ\'ÎSÿ;÷IõÄïQ3güV=ùÄ£f³©~7ó~¯û Ú^Qú†ÒÖfš-İ,°r€Q˜—qfåZMö+fİfÖ ³N·®—¿1V#dM—oÖ„èl¸¿pJ\Znù	°Ûo»Y½‘öªn´¥ù~vş5wÎê¹gçê¦[šğ1£Ôæœ·­†ûª…o(ñFp[®ƒ¬à\0ä G\0Â4/ÒDg›Un5Ó½‚¸­4ò›É[Íº º\Zî£Níİ»M=úÈõËÛÇé†Zv%÷WqqCÔ¯\'Œ×[»KKßõºªíeo(íİb-·«£éf\r#\0äˆÜ¼Œ7ë áŞE¼Wîç>ë~¢ek·Ùø}îU®oş¦¾üòS•øÜÓ*aÔujÄğ+ÕĞ¡W¨¸+‡¨¡f£}ÍÕÃÕ÷ß£û‹Ö÷öTÛ+ŠŞP:º{8»—³ÀÈ\0rDh^d%^¾“×I÷w©u“££á>BuQEÉJkHõı€€ä /!2Şjc:ù~c¬ûô-İfã÷ÕEo(}´q¶t³‚#\0äˆ¼HS,»Ç û¿ÔºÿA‘İp¦º¨\"ü\rÅ÷€gß3ëNëo0|oÇÔXÁÈ@\0D@^äHä3OğcÈwº·FvÃı7ª‹*‚ßP|·DK³¼Ìú–ÑtºM7+8\09È€0Î‹üô—¼wk¹»–›ß!ª‹*BßPüíö}§õ¿¨ šnÏfÛ®‰×ónVp\0r#\0aš—Ü®¨K©[¹ÍÆï ÕEo(š`ÍsKM·¿éSıLÏwºYÁÈ@\0„Y^îšõ\nácV`¶~à0¢m\r÷ª‹ª‹ÒÖ±¨ÙN¢‰ö×t·µÙömºÙ½œ€ä@äE¾W½8Ä™hœøï‹ûÂ+«¹Šk¹áşk‡Jî#3s™s:\'\'MŸ®®Şğ6ååï¨={6«’’^÷ãyŞ®}ûv¨“O>©MÏcüø›š]¶fÍ¿Ógg¯VgyF»ÿç””yòÚ…ñØhOÓÛZÓl³íùøŸléf G\09ĞåyYkÖm!~Li²Â°á¶+Ûğ¿UÓlüjƒ®={ªää9f3\\¬ï?1ñqç´4ÓÒ8»›ÙZ³ñŞ¦²²V:ÏeãÆUº10á}Z.«­-ÕeZ\'×rJï€ÏçĞ¡=zšşYßgÿşÿ¤ÒÒ^4›âÿU]ô¯Îã;VÙì~+*òTMM¡æÖ[®&Oş•3}qq–®°pƒ¾lÒ¤_ê¿ò8qq?Õ§¥6lX®Î;ïÜ _Ç.n¸[¾Ív[›İ@Mwv6Û6¾ÓÍ\n@\0r ò\"»w_âÇŒ1ëÓ0n¸=·jğn¸?mwÉígÌ˜¢Ş«Ï8°KÿÍËû£¾®¾ş#}^\Zr»iÎÊZ¡Æ½AM™òŸf³úªÓz÷Ûzúòò?ëæWJ¦‘æ¹_¿êÇ²o3qâmzZ—ëİğÊii´×«k¯ªæÍ{ØyÒxÛÏùÈ‘÷Ô°aCôıØÏË~Ş†ŞZŸêœÎÈXêœ^³f±s²Å]nkŸÿş÷{©Çÿm»^¿0íi¶[jº«:Ğlwôù€€ä /¤Î¬ÓCü˜òx\rĞp{nÕŒs7Üûƒ®‚‚5º©ÍÉYm6³sÕi§j6ÍèFô;Æ©ÒÒª©iŸ3½ı¸2m]]¥JOOQ¯.|Z_.ÓË_¹Îßã]xáUlì¥Ÿ<îèÑ×©I“n7é•jñâyz´4èöerÿiiÉÎmäùÉe••ùª¬,ÇlÜÿOŸÏÎ^å<gyrº¡¡Z•—çšÍz™.¹nåÊôéššmºÑoÏëf\r·ïØèèeMwGšmß¦›ït³‚#€ä¥…TEb)õ—v•Ü¶ª*_ÿ7ï!³ùÜkí¾C_/ç=§MJzBïŠ]W÷JN­/›:õ×úï¬Y÷éİÔ=Öñ†»ùuöãîß_¤ÿï4ÙYYËõ‡ûöªŠŠ?{İî‰\'î×[Üo¿}´Ú²e­ª®~WßşĞ¡]ÎsÎÈXâõ?¤¥-R[[Â—êÓÙÙ¯êÇhïkæ•ÔÁLÈnä¾[¶«¬Ë;\"Éº¯>,cYÁÈ@\0òZláÜ@í4Ü[,í#¸›ß¾ ª¾¾R]~ùOÌ†v…¾Ï;î¸IŸ.+Ûä4¢gu¦:çœè&Xn#—_rÉ`UPğG³Ù~ZÅÄĞ[¤W­zA_·oßvç¯ı8Û¶­S“\'W¹¹«õîäRò8Ë—\'êi]®›=7ûñíóÕú2¹ßé**r×åèÑ2³¡¿DÅÇğš&#ãe¯ó#F\\áüßòÜä´lİ¾ùæQA¿ö}†ñØhí¨ä­iiw[~§;¶p³‚#€èÂ¼ğîÖ›)ãxÃıIĞU\\œi6¶Kô}¯^¤¾@UW8°»ñ]âL/ç/–İÉ+Ô;Tzz²nÚkjì­Ê;­ïpopnÓØø‘súÂctCÜÚó’ûé&MºÍl†—«¬¬eêŒ3Nóšfß¾mú¾¥}TõU*//Íjø·9mèİËWzİ·ı?úàoËõiiæİˆşu“†;ĞØ°›Û:ãÄ|‡»=M7ßáf G\09ĞÅyá(åÇ›š\"³Æ“Ülüş/èª­-TË—?§cşü‡Ìf;_¥{îÜúzwsú²3½œON~J9²Ëlj·š\r÷\"}Ycc•utr÷®éoø}¼ã\rwËÏKîãá‡ïÑa—»q^ÑlZû±kj\nÔáÃ¥ÎóëªªŞq®ó¼ïøøáºÑ6ôîÿĞ§ûö=KÍ˜1¹]¯c7Ü­\rß&·­[”ıô—¿£”Óts”rVp\0r#\0a~‡»å­–>\rwMĞeèïjZMjJIqü¬©©Ú¹ŞİpŸ~Ø0ù­e*#ã%•šúŒŞåÜ¾NîCşfe½â÷ñ7Üîó.×GÖ®à»›=/ÏÇµ/ów¿õõï[[µ·Xßß¦Ÿ‡\\.»¼Ëóméÿ—ÿ¥=¯ïı„ñØğ×t·Öì¶ö;Û­ıNw C~‡›€ä@Xäe€YŸÙPt”ìÆ‰3H©ƒªÆÆJÕĞPa6±KuÃtøp‰ş›—·Ú™Æİä.õ:_Rò¦>ír¹·,—•½­Ï75}äLSPf6¼åêæ›¦æÎ}P%&>b6Äïª©SÿSM›6QŸ–*,\\«N;íuìØ^¯çf8»”ßªkãÆT«¡§ÙÿQW÷uà¶ÿÔÏÉ~.òa€ïÿã[†Şj¾<è×ÎßıDĞXimskÍ¶ÑÎ¦ÛŞ­}ËSVp\0r#\0á‘—\\#t[Ã¤!Ø\Z©3H©êWSSUDİï‰zœ|C	´¥»­Ív°M·ıx4Û¬à\0ä G\0Â(/²‚^n„f+·ì¢;!rî¨.ª}C‘-İ¾»wßiÿ;Ûşšî‰>Ãw¶YÁÈ@\0„i^òÿ½jù¾øV#´»¯wrÃ]EuQEğŠïO†y6Ïmi¶VnÇO±‚#€ó¼Ä˜uĞ¬¸tÿ—Z÷?(’gRR]Tş†â»{¹4ËàêË÷vııo°‚#€ä%DÆî¨Åœ€f^îwB¤Ï ¥*©.ª(xCéìßÅö·»:XÁÈ@\0„q^&YÍqgmé¾Ôº¿G¢a)õÕE%o(ÕtwvóVp\0r#€¼„ˆlé–-gòî|ßZ¾³}Ğjâ£b)UAuQEÑJGwg7rØ\09@€ÏKŒáş¹°òv¬ØËÖ·\"Ã}€´AÑ4ƒ”zŸê¢Š²7”öUœ¤±ÀÈ\0rDQ^n³\ZoÙ-|±áş	±Ì:İºşt«9— Ñ¬j«ÑdDîÑÈ[h¸Ë©.ª(|C	v·pv#g\r#\0äˆÒ¼0ë³ÖZÍwƒõ„åï§feî]Ğc¢y)õÕE¥o(mm¢‡˜Ug}àØ\09@\0ò\rwÕEÅI°šé„®ÿŒf›6@\0#€¼DyÃ½—ê¢Šò€ÚÒÍnä,°r€ä¥»4Ü{¨.ªnßæšf›6@\0#€¼t\'Ÿ|Òw\r\rÅfó·›\nq}õUá>s¸ºÁ0³›ì$šmØ\09@\0òÒmüãCùùKÍpâZ¿ş…·ÍY°³›µkaÀO±ÀÈ\0r—îáª«.[7gÎT³,¥B\\cÇ^•f¸v…˜G\09@\0òmøAì€ç|ãrí 	m}Ò£G\nsÄ±0\0ó G\0È@^¢Tÿş?,MJz&8„5fÌUKÍ—>—…˜G\09@\0òİyæiõEE+h†CPùùK×›¯ùA³.fa\0æ@\0#€¼D¿øsÎ9ûï4İ\'¾ÙîÑ£GÑ=ÔÍÂ€y#\0ä /İ·é>é¤ï›7ï¾ÏùNwçgÛÚü Ñ}‹…ó G\0È@^ºµA={~/çôÓO=<eÊ-»7mzñ`CC!\rs;ê«¯¶ï[¿şù·åhäÖÒä;Û³0\0ó G\0È@^º·KÍšcÖV³\Z¬IW.Ãı;ÛòÓ_q)Ì#€ G\0yÀÂ€y€ä /\0X€y#€ä\00\0r€ä\0æ\0r#€¼\0`a\0æ@\0r\0,À<È\0r\0,˜G\0È@\0ò€…˜G\09È@^\0°0\0ó G\0È@^\0°0` G\09È\0`ä G\0yÀÂ\0Ì#€ G\0yÀÂ€y€ä /\0X€y#€ä\00\0r#\0ä\0æ\0r#€¼\0`a\0æ@\0r\0,À<È@\0\0,˜G\0È@\0ò€…˜G\09È@^\0°0\0ó G\09@^\0°0`ä\09È\0`ä G\0yÀÂ\0Ì#€ä\0yÀÂ€y#\0ä /\0X0x	\0r#€¼\0`a\0æ@\0r\0`aÀ<È\0r\0,˜G\0È@\0ò€…˜G\09È@^\0°0\0ó G\0È@^\0´[–ş–j\'/l€ G\0yœ!f¹Zi¸Çğ2±ÀÈ\0r\0ÁËn¡Ù.2«/l€ G\0y¼!-4ÜãxyX`ä\09È€öó÷]nùî6[·Y`ä\09È€ğ÷]n¾»Í G\0È@^\0t‚Lƒ­Û,°r€ä@§‹óh¸x9X`ä\09È€Îc—›­Û,°r€ä@\'\ZÂÂ€6@\0#€¼\0áŸ*¥z§¤¤Ìœ8qâŞØØØ†Ş½{úù-*ˆêÙ³çwçŸşgÃ‡ßhşÉ›Qäˆ‘#rDÈ9\"/@7²lÙ²{FY£æÌ™­òóóTCÃWæ²ú;ªƒ%¯cQQ¡JL|N\r8°±ÿş{Í—übVpÈEÈ9\"Gäˆ‘#òD¹ÔÔWÖ÷ë×O%%½ \\®FsaÒDÀJN^¤úôéóÕ©§z+8äˆ\"Gäˆ‘#rDÈy¢x¡|Á¨¢¢íæBã[*DU^^¦úöíû£{ü~¸\"G9\"Gäˆ‘#rDÈĞ­,[¶ôù´¨h›¹°pyÕÒ¥/©1cÔ¨Q×«ë¯¿Fİ?R%/Jj6Õş*/ß«N9å”/ŒèßO‘#rDÈ9\"Gäˆ‘#òtr ‘#¯©OJzŞ<ùW­X¾Tşù(uë-cus£Š¿V\rz…Z¤ÎßPT‰‰ó?ïÕ«W+8äˆ\"Gäˆ‘#rDÈy¢DJÊÂ™11?R.W½¹€hôª„Qñz|Ã\r#úÙÏ®SÃ‡]i.œc›MOu¬Î>ûìOÍYÇ\n9¢È9\"Gäˆ‘#rD^€(0qâ„½sæ<i.¾nV#†Ç©ÌWYoe¨”“ô\' Wª/—Ó.×—~oGµ¯¦M»w§9KYÁ!G9\"Gäˆ‘#rDÈbc‡4äçç˜††fu÷İÕÁ¿~ª¶nyGeÿiƒZõjªZŸ¹F}\\ı¡úŸ©“Õ·ß~é÷vTûêİws˜³d\'+8äˆ\"Gäˆ‘#rDÈy¢@ïŞ½UCÃçæ‚¡¾Y=6ë!U\\´Eí(Şªvï*Ñ%§wìØ®{ì!¿·¡Ú_2ÌYâb‡Qäˆ‘#rDÈ9\"/@”¼é(õe³r¹ş®fÍš©¦üf’*))TåïíÑµk×5í¾ÿV3¼O}ıõç~oKµ¿¢|¡¦È9\"Gäˆ‘#rDÈyºYÃ]çUŸ«uë^S±±?UÕUª§ßçU¥¥ÅjÈå—ª×W§ª††Ïšİj±‚C(rDÈ9\"Gäˆ‘ ªÌÿpê»ï©·6¤«aCcUMu•z¯l·Êİ¼Qe¾ùG•öúJ•úÊKæB;Mï†tå•—«ôôêÛo¿ğºªıÅ\n9¢È9\"Gäˆ‘#rD^€¨Z0sjë–Mú7eaœ—·Y½™‘®È+–/Q//^¤’^xV=3ïi} Å/-T×^3Bm|{×}Pí/VpÈEÈ9\"Gäˆ‘#òDÕ‚ùïN=6ëwúˆ•²\0^–ºX×’—“Uò¢êùÄyêç>©øı#jæŒßª\'ŸxÔ\\(gªßÍ¼ßë>¨ö+8äˆ\"Gäˆ‘#rDÈy¢jÁü…S²`–ŸŠ¸ı¶›Õi¯ê²,¤Ÿ?GÍó„zîÙ¹zá,ë1£Ôæœ·­óT\'+8äˆ\"Gäˆ‘#rDÈy¢jÁ|Ô©½{·©G™¡~yû8½à•]üU\\Üõë	ãõ§¢¥¥ïzİÕşb‡Qäˆ‘#rDÈ9ê\"YÖsn©v\Z\0‚]0îU®oş¦¾üòS•øÜÓ*aÔujÄğ+ÕĞ¡W¨¸+‡¨¡æùš«‡«î¿G;ö=­ïí©ö+8äˆ\"Gäˆ‘#rDÈQb¸;¼¥†{íô‚ù&Å\n9¢È9¢È9\"Gä¨e·Ğl™Õ‹ö	zÁü&Å\n9¢È9¢È9\"Gä¨\ri¡áGë´kÁ|˜\n“Šâ•€ëK G9\"Gäˆ‘#rDÂš¿ïrËw·Ùº\r´oÁü7*L*JWpâÍúÂ¬$ëïrD‘#rDÈ9\"Gä(lùû.7ßİÚ¿`>D…IEá\nN¼ÏJlQø,\nÚŒ_rDÈ9\"GäˆŠ¦e\Zlİ:kÁ|\n“Š²œø\0[â£pËã—‘#rDÈ9¢¢)Gq\rw´~Õ‚ù\0&E+8	­¬ÄØ×\'#Š‘#rDÈ9\"GaÉş.7[·-˜ÿJ…IEÉ\nN[W^¢iËã—‘#rDÈ9¢\"=GÌºÏ¬µfU›Uoı\rf}b¸w3ŸiM íæZ*L*\nVpâƒÜRìôäˆ\"Gäˆ\"Gäˆ‘£Î%?÷•k5Öª•oÖZ) MæO©0©_Áiï¹]]„¯ä0~É9\"Gäˆ‘#*ÒrcVvM¶¿ÚjÖ´T@‹æıT˜T¯àttw¼HßñKÈ9\"GäˆQ‘”£ñ†ûHıÍ³ËjÀ\'›u±Y}­iû˜5Èºìnî»%\\>¨bk7xÁü*L*BWpZ; M¨ï‡‘#rD(rD(rØÃûw¶åt¢áŞâİı¬é}«{2­àwÁ¼\n“ŠÀœÎ>ºk¤nY`ü’#rDÈ9\"GT$äh¼O£\\i¸·f·‡Ü®Ü§éfK7Ğ|ÁüI›K¦ß¶m­ª¬ü³>}àÀ¿Óåå¥©#†¨É“ÿCMšt›WmÜ¸\\ee-S-=¶\\7mÚm~^«W\'©óÎ;7àõ55ïêû¬¯ÿ@×†\r¯¨Ïs®ß·o›×ô%%TYY¶>-?jVréÍ÷òåÏ9çëê*‚~}#hìø`æ{fİiı\r†ïí\"ñÀ5äˆ‘£çˆ:±EÈ•9Š1¼w#—ï_÷íà}Êîæ¹†÷îåƒh±\0¯óÿµ©JKßÒAºùæQze_Nß{ï¯õé3Ï<C-\\ø„3­œ—é<oß¿ÿ?©k¯Ó§«TK-×İtÓ\rm~nıúıP]}ul‹ÓHc ÓTWçëûn6,©Îÿâ^Á÷~oè¿\'Ş¢¶lù£FÎ?õÔıê;~¡rs_ÓÓ–”¬××/Xğ˜¾^.ÏÈX¬.ºèB}›}û¶êË/ÓâsŒ ßOşeåd™õü—±’èv‘¶’CÈ9\na¨_äˆQQ™#ÏÆ¸²šmÏ¦»Ü§‘p|Á\\Ój;V¦tùå;—ÉùÌÌ—õé={²¼¦w7\n?óº,=}‘¹R¾Ì\\iŞb6\nª–[®“Æ\"ĞõMMÕú>ì:ãŒÓÔèÑ#óGîV……ëœéKJ2u3Q\\œ¡.»ìßôí{öì©WäåùÔ×¿ïLër}¤ÿÊe2½<—Ã‡wªÔÔgÔi§ªÿ‡5k’ULÌ\0ç6r½¼öãËmöïß¦ÿÊôöëçû:ùû¿#påÆ°¶xîNÔ–•Ï•»&z\\Iß¡#Gäˆ…(GThŠ‘#*êr4ÎğşÎöÅ|ÿŞ»ª³k9p|Áüq‹UW÷\Z0 ŸÊÊZªN9¥·züñ{Unî«:L“&İªOŸ{n¯Ûôí{–ÊÎ^®FºJM™2Ş\\YNÕÓŸvÚ)fÃ°PUW¿£=vS“{7Si6ZzN²«íØ±×9ÏeÂ„›ôi©yófzİiézkå}«>Ÿ“³RŸ·#GJi+*6éËjk·«¼¼ÕÎõîÆh±FÃ÷ùÉõwİu»ª¬ÌÑ§+õß}ûÜ»áÊshíµ€œ@+şVVZZÉñ7}ªŸé#å;täˆ‘£äˆ\n]‘#rDE]<·n\' ÇxÆ`+7àoÁ\\İbÕÕ•é¿7¾¢‚œœæÊoSaá\ZU^¾QwŞÿóºÍñ-sîóyy¯Y»·Æëó¨@½gÏ[Ö–¹sÌ¦¡ªÕç\'%Ó§§ÿÁ9¿aÃË*&æ_œó)jàÀ«ªªÍê’K©Ù³p®+.^§o/[ì<ïïw¿›l64¶š÷V¶Y³¦êÿ=--É¹y}bcÿ]M›6Ñl2õãÈ4©©óÔYgi6;õmí×±µÿ#DÜX¹Ib¥ÅßJN[Wn|Wrºbw¾¶¾Väˆ‘£äˆ\n]‘#rDEUÇ·>»¬ó\'‚½Üó\'Ãbhµ\0½`ş¨M•™ù’:ùä“tÃ°jÕszWÒ‡¢Ïÿû½ô_{Zw£pƒ>½o_¾Ó$ØÓ46V¨@-—}­¹¿VŸnjú°Åçeßeå&ç2Ù’8bÄå^Óee-Ñ»ÌNŸş_jÒ¤[tÉó‘Ûfd¼è÷y:TèÜ·ü•†@n#MŒıÿI¹\\•êÀíÎùÒÒ7õó¶ïûÈ‘ëàXÛ[ü_B´`¶GĞqm¼M[W2Z[É	våÆóñ?ë‚-m}­È9\"G!Ìuâ‹‘#*ªrtŸÇtY\'øù¬õx¬™´Z€^0WµXlS¹¹+Ôµ×Æªo¼ZŸ;÷¤yóTS¦ü‡¾LÎ—”¬Ó·±…ÊÊlke¿RoÉ’ûëßWş[¦“ËÓÒèórzÁ‚GZ|~2Íüù3›]vûí	^—mÜ¸T×Ô¾şê«¯pNoØ°Ø™nÿş=­\\ŞĞğş[U•£òòV9Ï;1ñ!³‰ØîÜ¦¾~¯¾Ü~}ìÛÈßììTçq23SZı_B¸`¶+»•OFƒİ.ĞJNv®ÜønÑåJN[_+rDÈQrä9·m{ÃÉ†äËßt2ŞäC£É“ow> :şAÑR••õ²ßÕÖnÑ·õ|<É©¿Ç(/[_ïr} êêö8U]½YhÔÒÿ!ãy^2PSóçÿï””\'[}m~ø7ÎiÏììÙ³>¨×˜EwÚ2ìå­œÎÉY¦OËØtÉƒŒ3û}Ì¾­ïùY³î	øäù¾ e¿9²£ÕÙ%ÏÕóyÊíåëS·¼O=ºS¦«-[^WÓ¦ıZÿ•=ÏZËq„äÈ³	t‚ŸÏø6÷@¤4Ü¶XMM˜+ÎyYé-t7İt½µğm~i\n.ºè½°;z´Ä\\`¿hí^z·¾¾±±\\ù{l¹lêÔ_9ç«ª6y4ÍGv;•Çñw?«V=ëu™¬Xıä\'ÿÚìz÷\nÉ+Ín?lØeæB6C_·¾µòï~>ıúõÕ×ÙÓÛÿOnîrçö••Ò·lY­/—Óyy¯¶øZwÑ‚Ùó“Ñ\\¹ii%§ª+7}>\'úµ\"Gäˆ… GR2f}¤ÿÌ¦y‰u¤ÿÿÔ§İGúÌ™öø^\"Ço/{V¸?´\nœ!{ÉcÕÕí¶šÕÌ€Ó=şøT}º¤d­:v¬Ô¹Íøñ£é)Véé/èLH—/Ÿ§§±›ş)S~édÜ^VÈÊ¿ü_“&İ¬ÿÊ^\'qq—èÓR6¼d}Åûù¬\\9ß9½fÍšnK‘£èÎQ ’½®’“¯öíËs>µO——gé1î>öÆ‡ú½É¿†>¸å=æ\'Lø…“ÍÚZ÷ñ7ÜÍ¯ÿ1j¿7Èò¾ à5ë¸y^ÓÏı[¯÷AÉ‹ıö}Ê°ÜÎı!]š×õ’Ó²²\rúº\'¸Wÿo†şšWº^6ØËÉm{_Ï0ÊQµÇåŸàç3Èã±>¥Õô‚¹²MU]íş„±¢âm½“İBí…¤¬45U8ÓºWrâó‡m³Öoéóï)ßÇ6ô›~Ñìq7lH±ì|‘ª¯ßã\\.Ïá¬³ş?çü‘#Eæ‚±¹°^e­”¯ôºy.×ûæ\nG’ntÊÊÖëï¡}ª©ÙÜì¹¤¥=¯ZuìØNëËÛõãËi™^ş&%=ª§ohØkmíâñ&S`½i¼c¾<c6U©­¾Æ]¼`öüd4®>Á÷·’Ó‘•ß•œ„0z­È9\"G!È‘=d{ÎoY	—Óî¦¸2`†¤dåYÆ—Œ)’1½zõsz\\ËtrBù{î¹ÿ¬æÍ›î5­dÑ¾½¡·>?¡OŸsÎ¬¯cøŸröiYÈ_yÌ¶X[òŠœë%köm%s‰‰¿sÎË×PÜÍ~¥^Ø¹¹îº8•‘±Èjtrœûª¬Ü¨ÿ¿¶,«ÈQô¿µ6ÿgÌø/½Ì–ó26å¯¼\'ÈuöûˆŒG9/•÷±cGz5ÃvfKJÖè÷ûò%KV^ø#=N,xØ:FÇ.ë§$W9ÏCÆ¬¡÷ğª°>°µ÷jÙ¢³!ïm¾Ï]Ş[är¹ûƒÚìì¥:Ër{ÿ«½±sb¿ïØ·íÈë&cã+ó}OğóéãñX\r´Z€^0ĞbÕÖæë–©SÇ;—mÜø²¹22Ğ9/+\nö\nƒ}^Vˆ¦O¿S7%·µWşeÚÃ‡·é•†ÂÂ´€ÏA®s¯|ç›ùİzËßSOİÛlºÒÒµÎ\'Ÿ———oPÛ¶­Ö[æ,xÈëº={ŞtŞX<§—µººRsee“¾ìÀw­ïĞ^§ÏÛ—K54Ø\rD>Ÿ›»Lÿ5ôwO¶ú\ZÛÕ†…f¨+©ƒã«‡Ÿ-	UÖå‘n¯9\"GäèÄæHÆÑ€ÿd®Ô¿déÿ=Fì«ä´4Å·qé©\Z5j„Õ¼ìq¤ÿzüù>®ÜdÉ÷ñ7ïîóû÷ç9\r±ì!?T_––¨OË_yœC‡¶6Ÿò<\ZË¬­g<¶p\'ë-ğ™9R¨Ë½5o>-9ñœÖóşe\Zû´| f/+ì×Ëİ¤£îú~ÔR¼ª÷\0ÉÉyE¥¤ü^ácÇJô‡=wÜ1F¿?45½ßlœÈ´’QÏ²×ÔÂ…³¬-Ìk­fºÔë62½œv¹Êõ—ËRSçèÇª¨ÈÒ×IvÜÜ&ªÁƒÏÓÍ¼}{û~å½GN{şò~èŞRÖlLËóó7Ö/~Òy²—ò<‚}ÿ‰€…ê¨é¡~< ÜîŠ «©©¼]·£Z®.ş$t§µõ —5]kGíÈ…¶ü.j8oQğ}­È9\"G\'8Guu;õßëÆZ\Z‚}ûr­ë×Í•öõê¼óxİæx“ì>Ÿ—·ÂãŸ\n³éİ«|777Õj¸+Z¼¯\nôtösØ¿ÿk—öGiÊÊ2­-v+õcefº·:/_>×l8·\Z‘Vãş‚ÙHo·4¸Åk<KÃa?W¹9íŞúîoüKÃc?vié\ZçòË.Lx?jÓ¼¯ªÚh»àg\\ÖÖæéëå¼ç´IIëÃd,\'\'?f}­i¼õ]í)z7u{z{»ÛlıšdÚ³½û÷j=½ŒsùpÉóñíLÉmåCµaÃ.õzşöóµïÃó¹º›çãË”ôôçõå·Şzƒ^†¸·»÷¬²3äy›~?ªc7Ğ¥\r÷ûT˜T-˜}ß¬}W&êŒó¹ö¬ätõwæ½VŒ_rDB”£ÌÌ…Ö‘ş_R«V=c®Ì÷P?|·>ï>ÒÿKÎ´gyºÙ$_¯OïÛ·Ùi¶íi\Z÷(ßÇÍÍ}ÅÚ\nœ¬î¸c´ºë®›õô†>Ùİ^Ó=Zhí6[l®äË×-Êô}Ú•“³Ô\\yÏo6>íÇw7Ğ­­ôãôémÛ^k6ıˆ?uÃäÉ·êÓî£ü_ïLW\\œ¦&Lã4#÷oŸÎÈø9\"G«¾¾T]~ù¿9cMÆ¿œ.+{ÓK²ÇÄ9çœ­öïÿ³3NdO-sÉÉ³ôS£G_­³ièİ²7;eúÔÔÙÖ–éuVSüšß±g[;côyiºíçfO»zõ|¯Û×Ô¸·PË‡\0Ë—ÏÑ_SZ²äIçq[z<CïRåÜ¯¡¿Æ•\rïG|‡èÚ†»<äåş„s¾®nG«Ó¯Y³À9ßØ¸Û:Ò«­Ş.%å±V§‘*ßûÎÉYÒ%¯KÌEf°bÓ‘OğıÔŠ¿£Â³’Ó•G…míµêÔ1½XgBN=º=àtãÇßØbN<ëÀ<çşÊÊ2ôJÔ†\r‹ô§úöÊUFF’3ıµ×^¡n¼q„¹’”£gè’Ó¾Ù\rÇÜ‘£èÌ‘Œai†í±)§çÎfm…»_M™r›Ó,—”¼¡oc7Ü••oYß-3‚şú><ÇçãÔÖ¾£W°÷ïÏÕÍ¼3ÉÎáÃ[œéä¾ä¶Òü§§\'š+ùÙjÖ¬ß8%+ëGl5›˜ÍÆ§Ü·ü?rÙ=v¬H_î;½»(÷hÖËõÿ*ÿŸ=Ëµ×YnØËßÛÊs³“ñ~ä¯Š‹_w>’1,»rWWo´æ·×kLÙãdñâßë±\'cW² M»äÁĞ{k8™”±\'ï\röX”ÛËûŒéI“nÒe¿Éõ\r\r¥Îü‘é\nWë¯olÛ¶ÊjÂ×[Í|×ÿ`çÎĞ[Ñ7êïrÇÇÇ9c_î×w¬ËãÉs–½Fä¹ÎŸ?İÚÍıéhy?â(å@×6Üï…¬JJÒÌ&y¥Z°`¦õ}²¥æJşæô|s%~¶¹ĞÜd-¼÷º\\–œü¨>ír¹·HÈ›€ïı¾f.¬S¬…vŠşt3.îßõi)Y`»w9ô¾oYñ¯«+ÖÏMÊĞ»CıÒ9-×…âõ	Ñ‚¹¥-ı$¿µß5míwQbtÍï¶õµê”ù_U•e5/;ã¡´4½Ùt‡å;ŸŞË¸îßÿ‡*-íY½\"#Y’ËÜ[İ\nÛ$&>¨?»¦æOÎe2)Üßs‘-²‚âoŒ¦§?Ö¹#GÑ™£¦¦½zùoŸŸ7ï·Ö‘şG:™ñ-i®%ÕÕo›\ró6³Qøƒu¤ÿIúúÆÆ]Êóq÷ìY£?ğ’†A¦‘Çt7\rùfş¦¹ş€~L{zÏŒUTdêéí1(ïm¾ÏGòlè­ì#õs’Ç²ó*ù‘¬HÃã;%‹öt“\'ß¢O÷íÛGÍ˜q§ßñ¿rå\\ç´üOòŞkè]eß±vÎ\"G¼ù­ÚÚ?ëõ1CÿL×zœÊò[>Ü²Ç…äÈwıìÈ‘-zNŞä2;[r{Cïu±Ülj78ëp«W?ÓâØ³ÃÎ˜</{QÆ±äñø‡»ïGóø‡lÇß³ìõIÉ ûì¯üÚ™±SşFøû¿Ã\rtmÃ]²:|¸@¿ù76–êrÒŸc}jÿ¢^°Ú+·³~G¼kıLÅƒ~ïßıÉ~¢sŞ}D×ãÓºè:EŸnh(QYYÉú6sçŞg­à™ñçñìçÙÔ´\'$¯Ş—híıÖVnŒv®äØ»‹ö¹·ÔıÖ9/[¯¤õœÆåÚm®”/Ô§¥Ñ.,\\e®Hqnç^™åu›úú^+™™Iú;°\'Õ—Ù—KÃ`ßFVšd×Ai:oyxÑZÊ²l¹#GÑ#öx•1{±ó>\"ãÔsÜ¸·p_çœ?tÈşy£}Ş~’ÓGnuŞäÃ©ÛoÿY³qe?¶œ¯­uw[²$yq7Ç§u7ÜeÖÑùœÇŞ²eE‹ï]öôÆ¶üÏş®“Ç·jÉ¸¼†s­2çÿ6ô®ñw‘#ŞÎw{lËx—÷Cï²Ç¹^Æ—çôòj—2æSSŸÒØúfF–û·‘±(ï_wÜñs]¾ï3••ëLÊÃeek­_ÎHuŸlœ1ôÖï…~ÿ;ÃÆ¨Ë.äuİüù÷{ıŸr¹™»î\ZçL\'ÏÃĞ»¾¿\ZéïGÌrYÏÇe?úîïmÛÿ{­ Ì{CZöÂ¬²2Óút§Õd[[ôÒüŞfõêyÖbßwCÃs!¾N7ævs¾rå}º¦æmİ ø»ï±c¯ñ:/÷!oîŸü¾6a>^mYhëÊM°+9öã‹öú;i7ú½|ÄˆË¼.“†vôè«Ì•“_è•“Å‹Ó[”gÌ˜è\\fè-=ãÜGYÙ\ZsEåsf‹ÙüşÆúY—b=Îíi²²9![4|Wª©i·“-¹¯pÌ9ŠÎÕÖnÖÍ³ûC(÷e2Ö/¹ä_óò>a¿_Øçekõôét6<Kn»aÃ”¿Ç•÷£iÓ~¥)w~ƒßçdŸ–ÇqïÙá¾_ù+uõÕ—7{_“ìH 9–i$ûò¾(§‡\r»Dåæ.	8¶³³S¾Frçû¨»9?~İ¨QÃôc¶%_ä¨û½Éú˜,Ïå½À^»›ÜW¼Æ…ç{…ûƒÒ×õi—k—ó~c¿_ØÓ,óºÍ‚3ôôÆ^qñkNå¯|È+ï\'r?ƒÿØ™VËór’i°=s\"ÿÇÃÿ—Ş+Dê©§îqŞ¿ìª¨xÓyÏç±páCÎß(x?Êõã‰\'è1ñxŒ­´Y€³`Ş’ª«Û®·DL›6^/e¸oßŸTjê“z!wäHµµk»^Îßzëõz\ZCïfû’^IZ²äq•˜8]_—·ÔZñ×y»Ñhl,±>‰}AŸ–…¯»a?şœ\\®ãß’ÛÈŠ•l-,.^e½©,Ùëc?÷3²eÁwwº;à×ÔßJÎÄ ¶`DMrs_6WÊªÇÛªUsu³;cÆ¯Í•e÷–`iì±lçdÿşl§iu7Éúö2Æ%ú¾eºr½²aŸ¶?ô*/_Ûl¼WU­wš}YI—œÆÅıDÿ•Ú½`OXæuŸ55í\né2º«+”ÿ/9êïG¡£á˜ÛõœÂ,Gã<Æ·låîìƒ§]lßŠ.56pÌ»CV.×Nså³s¾´ôus!Wjí~÷¼ÙLä[ßÏÙìu;÷\'¨¯™ÄFkW¥Àánd÷¦EÖ÷İnÖ§¥I¸ùæ‘^Ó®^=×úäõ³1xQß¿}{ö¼á±Õ14¯9¿Wèû-++mY¹1Z¹](j¥KsTW·M{ûü†\rIÎ·³QU•i6¯;ü—ÌÌÎy™ÆĞÇFXì5]mí&³_§ª«7èû–ñîŞzñÕx¿éÑè¶<>§L¹EßnË–ea›;rÔırDñ~DÈ9j“|†¸Òè¼Ÿ“Ÿ+7¼·n÷2\0Øæ]!«úz÷o#Şxãp³)xÉj&Ş´v“KÖÓo\"ßÎĞåxÈ9=uêmÃóö†ş¾Û\"}ZÏ}D×ãÓ._ş¤Ş}oŞ¼ûôù††\"ëû<ëÍæãÖÁrrCöúDĞ\nçJÈ••‰Fğ?­â{»şŞjDçÈĞßmş}º®n«Õ@¿pÚØØ‹Ô¤Icõ8—1{Æ§¼ï¦&ûëo[ß]ëŒwCN¶J«Ë/¬ï¯_¿¨ûïÿ•sÿ2ÍèÑ#t¾~ò“Â6wäˆQ¼‘#Šùc¸÷\nñlŒ;ÚtK³í¹»ºç`-àµ`.\rY56y4¥ÖÖµuÖd^qšğ¼¼—½nw¼á.UGº<sÊ)\'›\rÉ–faè#ºÆš+ü­-mãôi÷]\'8ÓÕÖşI¹\\;ôÏ¾È455¬£Ï–êÆÃĞß!ZÒ×\'ÂVpü­ätÆ–Š®8úkXäèÈ‘wœ,ÈùmÛ–YÍçæ€ãåá‡ï4è,§Ü^-jv¿«VÍV+W>¥êë·éË\n\n–š\ròóºA—LUWg6»yoè²=ğ¹„KîÈQ÷ÎÅû9bü’£ÉÏvyîú-[ºÛ»{¹ÜÎsË6»’]½`nhp…\\¾¯j¯˜Ë\n¸{«[–nrr^ô»À’ïÊÁqìf$#ã9\'Ül\n¸ “Çima8aÂÏç\'GT¾ıöxç:÷î°¬à„`%§³W–\"*Gv6ÒÓç©¦¦}™Û`Ø°oq¼HÓì{YVVR³iÎõØz^ª›h;;’;CïÎæ÷1,˜®uCÿ&éïÛ4»2wä¨ûæˆâıˆ‘#rÔ&“|šn9-Rë×ÆÛËtÏøÜ‡Ô#´V@˜4Ü²UKÎ{né–Úßm¤ùë§Mû¿×ûÛÊí¹ óİÚço\Zy²Åï¼óşEo}óİ\"ª-İº‚co	èÈnw‘¸Û^§å¨´ô5ıİj{ìÉßY³îr>ˆji¼Ø»”»wû^híšéwzù°JKşø#¯ë$2şå6)éAë\0klÓ8îÊÜ‘£î™#Š÷#rDÈQPÆ[c]ù4ŞYVC.[¯íİÍe·ñAÖmŞ0Ü»{Ş®Îº\r€î¶`¶·vt\ZÌA­¤»E ÒH69\n§±N¹#Gäˆ\"Gäˆ\"Gmcxÿº=µÕà;Û\0fÌ!ìnx‘¼Û9\"Gäˆ‘#rD¨hÈÑmVãí\n²Ñdp4r€3æ°]Éb¸wA\ZG(rDÈ9\"Gäˆu¹f=`ÖZ³>1«Áúäï§†{wó™†{Ë8\0Ì,˜»P‚µò’ĞÂõŸEÉÊ\r9\"Gäˆ‘#rD¨hÎ\0Ì,˜#hËB´ì¶GÈ9\"Gäˆ‘#Š†\0fÌa³’+7äˆ‘#rDÈ9¢h¸°`fÁÜ¥+9IQºrCÈ9\"Gäˆ‘#Š†\0fÌ]&ÁúßÈEÈ9\"Gäˆ‘#\04ÜæÎÕ‡Qäˆ‘#rDÈ9@ÃM±`9\"G Gääˆ\"G\0X0³`9¢È9¢ÈÈ9À‚™bÁL(rrD@È\0Ìf#rrD@(r€3f#rDÈEÈE\0°`¦X0“#Š‘##r€3Å‚äˆ‘##Š`ÁÌ‚äˆQäˆQä\0fŠ39¢È¿ääˆˆ.\'Ÿ|Òw\r\r…,Ã ¾újû>s–¸•äˆ\"Gäˆ\"G Gä@<øÇ‡òó—°`ƒZ¿şù·ÍY²“QI(rD(rrD\0D«®ºlİœ9SY0†A{Uš9K•äˆ\"Gäˆ\"G Gä@0à±œóËµƒ…c×Ö\'=zô¨0gI£’Qäˆ1ÉÈ9%ú÷ÿaiRÒƒ,»°ÆŒ¹j©9+räˆ\"Gäˆ‘##r º:óÌÓê‹ŠV°ì‚ÊÏ_ºŞœÍº˜¡H(rDÈ99\"G\0¢Oü9çœıwÎ¡_(÷èÑ£Æ|ıÇ0ÉE@ÈÈ9Åç“Núş±yóîûœïşœøïöX»d¡L(rrD@È€îaPÏßË9ıôSO™rËîM›^<Èï9vŞï1ÊODÈQ+­iÈw{ØİˆQääˆ‘#\0İÌ¥fÍ1k«Y\rf)ªÃå2Ü¿Ç(?ÁQ+ÉE@ÈÈ9\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0¢ßÿğ9‹­æ6BX\0\0\0\0IEND®B`‚',0);
/*!40000 ALTER TABLE `act_ge_bytearray` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ge_property`
--

DROP TABLE IF EXISTS `act_ge_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ge_property` (
  `NAME_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `VALUE_` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  PRIMARY KEY (`NAME_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ge_property`
--

LOCK TABLES `act_ge_property` WRITE;
/*!40000 ALTER TABLE `act_ge_property` DISABLE KEYS */;
INSERT INTO `act_ge_property` VALUES ('next.dbid','1',1),('schema.history','create(5.15.1) upgrade(5.15.1->5.21.0.0)',2),('schema.version','5.21.0.0',2);
/*!40000 ALTER TABLE `act_ge_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_actinst`
--

DROP TABLE IF EXISTS `act_hi_actinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_actinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin NOT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CALL_PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ACT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_ACT_INST_START` (`START_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_ACT_INST_PROCINST` (`PROC_INST_ID_`,`ACT_ID_`),
  KEY `ACT_IDX_HI_ACT_INST_EXEC` (`EXECUTION_ID_`,`ACT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_actinst`
--

LOCK TABLES `act_hi_actinst` WRITE;
/*!40000 ALTER TABLE `act_hi_actinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_actinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_attachment`
--

DROP TABLE IF EXISTS `act_hi_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_attachment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `URL_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CONTENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_attachment`
--

LOCK TABLES `act_hi_attachment` WRITE;
/*!40000 ALTER TABLE `act_hi_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_comment`
--

DROP TABLE IF EXISTS `act_hi_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_comment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `MESSAGE_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `FULL_MSG_` longblob,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_comment`
--

LOCK TABLES `act_hi_comment` WRITE;
/*!40000 ALTER TABLE `act_hi_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_detail`
--

DROP TABLE IF EXISTS `act_hi_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_detail` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TIME_` datetime NOT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_DETAIL_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_ACT_INST` (`ACT_INST_ID_`),
  KEY `ACT_IDX_HI_DETAIL_TIME` (`TIME_`),
  KEY `ACT_IDX_HI_DETAIL_NAME` (`NAME_`),
  KEY `ACT_IDX_HI_DETAIL_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_detail`
--

LOCK TABLES `act_hi_detail` WRITE;
/*!40000 ALTER TABLE `act_hi_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_identitylink`
--

DROP TABLE IF EXISTS `act_hi_identitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_TASK` (`TASK_ID_`),
  KEY `ACT_IDX_HI_IDENT_LNK_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_identitylink`
--

LOCK TABLES `act_hi_identitylink` WRITE;
/*!40000 ALTER TABLE `act_hi_identitylink` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_identitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_procinst`
--

DROP TABLE IF EXISTS `act_hi_procinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_procinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `START_TIME_` datetime NOT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `START_USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `END_ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `PROC_INST_ID_` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PRO_INST_END` (`END_TIME_`),
  KEY `ACT_IDX_HI_PRO_I_BUSKEY` (`BUSINESS_KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_procinst`
--

LOCK TABLES `act_hi_procinst` WRITE;
/*!40000 ALTER TABLE `act_hi_procinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_procinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_taskinst`
--

DROP TABLE IF EXISTS `act_hi_taskinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_taskinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `START_TIME_` datetime NOT NULL,
  `CLAIM_TIME_` datetime DEFAULT NULL,
  `END_TIME_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `DELETE_REASON_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `DUE_DATE_` datetime DEFAULT NULL,
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_TASK_INST_PROCINST` (`PROC_INST_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_taskinst`
--

LOCK TABLES `act_hi_taskinst` WRITE;
/*!40000 ALTER TABLE `act_hi_taskinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_taskinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_hi_varinst`
--

DROP TABLE IF EXISTS `act_hi_varinst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_hi_varinst` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VAR_TYPE_` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `REV_` int(11) DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` datetime DEFAULT NULL,
  `LAST_UPDATED_TIME_` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_HI_PROCVAR_PROC_INST` (`PROC_INST_ID_`),
  KEY `ACT_IDX_HI_PROCVAR_NAME_TYPE` (`NAME_`,`VAR_TYPE_`),
  KEY `ACT_IDX_HI_PROCVAR_TASK_ID` (`TASK_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_hi_varinst`
--

LOCK TABLES `act_hi_varinst` WRITE;
/*!40000 ALTER TABLE `act_hi_varinst` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_hi_varinst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_group`
--

DROP TABLE IF EXISTS `act_id_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_group` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_group`
--

LOCK TABLES `act_id_group` WRITE;
/*!40000 ALTER TABLE `act_id_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_info`
--

DROP TABLE IF EXISTS `act_id_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `USER_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `VALUE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PASSWORD_` longblob,
  `PARENT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_info`
--

LOCK TABLES `act_id_info` WRITE;
/*!40000 ALTER TABLE `act_id_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_membership`
--

DROP TABLE IF EXISTS `act_id_membership`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_membership` (
  `USER_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `GROUP_ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`USER_ID_`,`GROUP_ID_`),
  KEY `ACT_FK_MEMB_GROUP` (`GROUP_ID_`),
  CONSTRAINT `ACT_FK_MEMB_GROUP` FOREIGN KEY (`GROUP_ID_`) REFERENCES `act_id_group` (`ID_`),
  CONSTRAINT `ACT_FK_MEMB_USER` FOREIGN KEY (`USER_ID_`) REFERENCES `act_id_user` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_membership`
--

LOCK TABLES `act_id_membership` WRITE;
/*!40000 ALTER TABLE `act_id_membership` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_membership` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_id_user`
--

DROP TABLE IF EXISTS `act_id_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_id_user` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `FIRST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LAST_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EMAIL_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PWD_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PICTURE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_id_user`
--

LOCK TABLES `act_id_user` WRITE;
/*!40000 ALTER TABLE `act_id_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_id_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_procdef_info`
--

DROP TABLE IF EXISTS `act_procdef_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_procdef_info` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `INFO_JSON_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_IDX_INFO_PROCDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_INFO_JSON_BA` (`INFO_JSON_ID_`),
  CONSTRAINT `ACT_FK_INFO_JSON_BA` FOREIGN KEY (`INFO_JSON_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_INFO_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_procdef_info`
--

LOCK TABLES `act_procdef_info` WRITE;
/*!40000 ALTER TABLE `act_procdef_info` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_procdef_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_deployment`
--

DROP TABLE IF EXISTS `act_re_deployment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_deployment` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `DEPLOY_TIME_` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_deployment`
--

LOCK TABLES `act_re_deployment` WRITE;
/*!40000 ALTER TABLE `act_re_deployment` DISABLE KEYS */;
INSERT INTO `act_re_deployment` VALUES ('d6403c84f1a743c1ab89e888519bd87d','SpringAutoDeployment',NULL,'','2016-07-18 11:35:55.236');
/*!40000 ALTER TABLE `act_re_deployment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_model`
--

DROP TABLE IF EXISTS `act_re_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_model` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATE_TIME_` timestamp NULL DEFAULT NULL,
  `LAST_UPDATE_TIME_` timestamp NULL DEFAULT NULL,
  `VERSION_` int(11) DEFAULT NULL,
  `META_INFO_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EDITOR_SOURCE_EXTRA_VALUE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_MODEL_SOURCE` (`EDITOR_SOURCE_VALUE_ID_`),
  KEY `ACT_FK_MODEL_SOURCE_EXTRA` (`EDITOR_SOURCE_EXTRA_VALUE_ID_`),
  KEY `ACT_FK_MODEL_DEPLOYMENT` (`DEPLOYMENT_ID_`),
  CONSTRAINT `ACT_FK_MODEL_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_ID_`) REFERENCES `act_re_deployment` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE` FOREIGN KEY (`EDITOR_SOURCE_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_MODEL_SOURCE_EXTRA` FOREIGN KEY (`EDITOR_SOURCE_EXTRA_VALUE_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_model`
--

LOCK TABLES `act_re_model` WRITE;
/*!40000 ALTER TABLE `act_re_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_re_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_re_procdef`
--

DROP TABLE IF EXISTS `act_re_procdef`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_re_procdef` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `KEY_` varchar(255) COLLATE utf8_bin NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `DEPLOYMENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DGRM_RESOURCE_NAME_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `HAS_START_FORM_KEY_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `HAS_GRAPHICAL_NOTATION_` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  UNIQUE KEY `ACT_UNIQ_PROCDEF` (`KEY_`,`VERSION_`,`TENANT_ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_re_procdef`
--

LOCK TABLES `act_re_procdef` WRITE;
/*!40000 ALTER TABLE `act_re_procdef` DISABLE KEYS */;
INSERT INTO `act_re_procdef` VALUES ('test_audit:1:15a6f274462541768f885bc1e2282724',1,'http://www.activiti.org/test','æµç¨‹å®¡æ‰¹æµ‹è¯•æµç¨‹','test_audit',1,'d6403c84f1a743c1ab89e888519bd87d','test_audit.bpmn20.xml','test_audit.png',NULL,1,1,'',1);
/*!40000 ALTER TABLE `act_re_procdef` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_event_subscr`
--

DROP TABLE IF EXISTS `act_ru_event_subscr`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_event_subscr` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `EVENT_TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EVENT_NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACTIVITY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `CONFIGURATION_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `CREATED_` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EVENT_SUBSCR_CONFIG_` (`CONFIGURATION_`),
  KEY `ACT_FK_EVENT_EXEC` (`EXECUTION_ID_`),
  CONSTRAINT `ACT_FK_EVENT_EXEC` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_event_subscr`
--

LOCK TABLES `act_ru_event_subscr` WRITE;
/*!40000 ALTER TABLE `act_ru_event_subscr` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_event_subscr` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_execution`
--

DROP TABLE IF EXISTS `act_ru_execution`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_execution` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BUSINESS_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `SUPER_EXEC_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `ACT_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `IS_ACTIVE_` tinyint(4) DEFAULT NULL,
  `IS_CONCURRENT_` tinyint(4) DEFAULT NULL,
  `IS_SCOPE_` tinyint(4) DEFAULT NULL,
  `IS_EVENT_SCOPE_` tinyint(4) DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `CACHED_ENT_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `LOCK_TIME_` timestamp(3) NULL DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_EXEC_BUSKEY` (`BUSINESS_KEY_`),
  KEY `ACT_FK_EXE_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_EXE_PARENT` (`PARENT_ID_`),
  KEY `ACT_FK_EXE_SUPER` (`SUPER_EXEC_`),
  KEY `ACT_FK_EXE_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_EXE_PARENT` FOREIGN KEY (`PARENT_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_EXE_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ACT_FK_EXE_SUPER` FOREIGN KEY (`SUPER_EXEC_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_execution`
--

LOCK TABLES `act_ru_execution` WRITE;
/*!40000 ALTER TABLE `act_ru_execution` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_execution` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_identitylink`
--

DROP TABLE IF EXISTS `act_ru_identitylink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_identitylink` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `GROUP_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `USER_ID_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_IDENT_LNK_USER` (`USER_ID_`),
  KEY `ACT_IDX_IDENT_LNK_GROUP` (`GROUP_ID_`),
  KEY `ACT_IDX_ATHRZ_PROCEDEF` (`PROC_DEF_ID_`),
  KEY `ACT_FK_TSKASS_TASK` (`TASK_ID_`),
  KEY `ACT_FK_IDL_PROCINST` (`PROC_INST_ID_`),
  CONSTRAINT `ACT_FK_ATHRZ_PROCEDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_IDL_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TSKASS_TASK` FOREIGN KEY (`TASK_ID_`) REFERENCES `act_ru_task` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_identitylink`
--

LOCK TABLES `act_ru_identitylink` WRITE;
/*!40000 ALTER TABLE `act_ru_identitylink` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_identitylink` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_job`
--

DROP TABLE IF EXISTS `act_ru_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_job` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `LOCK_EXP_TIME_` timestamp NULL DEFAULT NULL,
  `LOCK_OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `EXCLUSIVE_` tinyint(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROCESS_INSTANCE_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `RETRIES_` int(11) DEFAULT NULL,
  `EXCEPTION_STACK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `EXCEPTION_MSG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `DUEDATE_` timestamp NULL DEFAULT NULL,
  `REPEAT_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_TYPE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `HANDLER_CFG_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  PRIMARY KEY (`ID_`),
  KEY `ACT_FK_JOB_EXCEPTION` (`EXCEPTION_STACK_ID_`),
  CONSTRAINT `ACT_FK_JOB_EXCEPTION` FOREIGN KEY (`EXCEPTION_STACK_ID_`) REFERENCES `act_ge_bytearray` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_job`
--

LOCK TABLES `act_ru_job` WRITE;
/*!40000 ALTER TABLE `act_ru_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_task`
--

DROP TABLE IF EXISTS `act_ru_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_task` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `REV_` int(11) DEFAULT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_DEF_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `PARENT_TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DESCRIPTION_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TASK_DEF_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `OWNER_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `ASSIGNEE_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `DELEGATION_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_TIME_` timestamp(3) NULL DEFAULT NULL,
  `DUE_DATE_` datetime DEFAULT NULL,
  `CATEGORY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `SUSPENSION_STATE_` int(11) DEFAULT NULL,
  `TENANT_ID_` varchar(255) COLLATE utf8_bin DEFAULT '',
  `FORM_KEY_` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_TASK_CREATE` (`CREATE_TIME_`),
  KEY `ACT_FK_TASK_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_TASK_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_TASK_PROCDEF` (`PROC_DEF_ID_`),
  CONSTRAINT `ACT_FK_TASK_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCDEF` FOREIGN KEY (`PROC_DEF_ID_`) REFERENCES `act_re_procdef` (`ID_`),
  CONSTRAINT `ACT_FK_TASK_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_task`
--

LOCK TABLES `act_ru_task` WRITE;
/*!40000 ALTER TABLE `act_ru_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `act_ru_variable`
--

DROP TABLE IF EXISTS `act_ru_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `act_ru_variable` (
  `ID_` varchar(64) COLLATE utf8_bin NOT NULL,
  `REV_` int(11) DEFAULT NULL,
  `TYPE_` varchar(255) COLLATE utf8_bin NOT NULL,
  `NAME_` varchar(255) COLLATE utf8_bin NOT NULL,
  `EXECUTION_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `PROC_INST_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `TASK_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `BYTEARRAY_ID_` varchar(64) COLLATE utf8_bin DEFAULT NULL,
  `DOUBLE_` double DEFAULT NULL,
  `LONG_` bigint(20) DEFAULT NULL,
  `TEXT_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  `TEXT2_` varchar(4000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ID_`),
  KEY `ACT_IDX_VARIABLE_TASK_ID` (`TASK_ID_`),
  KEY `ACT_FK_VAR_EXE` (`EXECUTION_ID_`),
  KEY `ACT_FK_VAR_PROCINST` (`PROC_INST_ID_`),
  KEY `ACT_FK_VAR_BYTEARRAY` (`BYTEARRAY_ID_`),
  CONSTRAINT `ACT_FK_VAR_BYTEARRAY` FOREIGN KEY (`BYTEARRAY_ID_`) REFERENCES `act_ge_bytearray` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_EXE` FOREIGN KEY (`EXECUTION_ID_`) REFERENCES `act_ru_execution` (`ID_`),
  CONSTRAINT `ACT_FK_VAR_PROCINST` FOREIGN KEY (`PROC_INST_ID_`) REFERENCES `act_ru_execution` (`ID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `act_ru_variable`
--

LOCK TABLES `act_ru_variable` WRITE;
/*!40000 ALTER TABLE `act_ru_variable` DISABLE KEYS */;
/*!40000 ALTER TABLE `act_ru_variable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_article`
--

DROP TABLE IF EXISTS `cms_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_article` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `category_id` varchar(64) NOT NULL COMMENT 'æ ç›®ç¼–å·',
  `title` varchar(255) NOT NULL COMMENT 'æ ‡é¢˜',
  `link` varchar(255) DEFAULT NULL COMMENT 'æ–‡ç« é“¾æ¥',
  `color` varchar(50) DEFAULT NULL COMMENT 'æ ‡é¢˜é¢œè‰²',
  `image` varchar(255) DEFAULT NULL COMMENT 'æ–‡ç« å›¾ç‰‡',
  `keywords` varchar(255) DEFAULT NULL COMMENT 'å…³é”®å­—',
  `description` varchar(255) DEFAULT NULL COMMENT 'æè¿°ã€æ‘˜è¦',
  `weight` int(11) DEFAULT '0' COMMENT 'æƒé‡ï¼Œè¶Šå¤§è¶Šé å‰',
  `weight_date` datetime DEFAULT NULL COMMENT 'æƒé‡æœŸé™',
  `hits` int(11) DEFAULT '0' COMMENT 'ç‚¹å‡»æ•°',
  `posid` varchar(10) DEFAULT NULL COMMENT 'æ¨èä½ï¼Œå¤šé€‰',
  `custom_content_view` varchar(255) DEFAULT NULL COMMENT 'è‡ªå®šä¹‰å†…å®¹è§†å›¾',
  `view_config` text COMMENT 'è§†å›¾é…ç½®',
  `create_by` varchar(64) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `cms_article_create_by` (`create_by`),
  KEY `cms_article_title` (`title`),
  KEY `cms_article_keywords` (`keywords`),
  KEY `cms_article_del_flag` (`del_flag`),
  KEY `cms_article_weight` (`weight`),
  KEY `cms_article_update_date` (`update_date`),
  KEY `cms_article_category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æ–‡ç« è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_article`
--

LOCK TABLES `cms_article` WRITE;
/*!40000 ALTER TABLE `cms_article` DISABLE KEYS */;
INSERT INTO `cms_article` VALUES ('1','3','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,'green',NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('10','4','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('11','5','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('12','5','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('13','5','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('14','7','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('15','7','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('16','7','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('17','7','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('18','8','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('19','8','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','3','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,'red',NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('20','8','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('21','8','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('22','9','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('23','9','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('24','9','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('25','9','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('26','9','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('27','11','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('28','11','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('29','11','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','3','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('30','11','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('31','11','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('32','12','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('33','12','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('34','12','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('35','12','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('36','12','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('37','13','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('38','13','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('39','13','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4','3','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,'green',NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('40','13','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('41','14','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('42','14','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('43','14','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('44','14','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('45','14','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('46','15','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('47','15','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('48','15','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('49','16','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('5','3','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('50','17','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('51','17','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('52','26','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('53','26','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6','3','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('7','4','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('8','4','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,'blue',NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('9','4','æ–‡ç« æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜æ ‡é¢˜',NULL,NULL,NULL,'å…³é”®å­—1,å…³é”®å­—2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');
/*!40000 ALTER TABLE `cms_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_article_data`
--

DROP TABLE IF EXISTS `cms_article_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_article_data` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `content` text COMMENT 'æ–‡ç« å†…å®¹',
  `copyfrom` varchar(255) DEFAULT NULL COMMENT 'æ–‡ç« æ¥æº',
  `relation` varchar(255) DEFAULT NULL COMMENT 'ç›¸å…³æ–‡ç« ',
  `allow_comment` char(1) DEFAULT NULL COMMENT 'æ˜¯å¦å…è®¸è¯„è®º',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æ–‡ç« è¯¦è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_article_data`
--

LOCK TABLES `cms_article_data` WRITE;
/*!40000 ALTER TABLE `cms_article_data` DISABLE KEYS */;
INSERT INTO `cms_article_data` VALUES ('1','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('10','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('11','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('12','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('13','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('14','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('15','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('16','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('17','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('18','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('19','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('2','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('20','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('21','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('22','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('23','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('24','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('25','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('26','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('27','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('28','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('29','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('3','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('30','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('31','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('32','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('33','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('34','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('35','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('36','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('37','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('38','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('39','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('4','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('40','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('41','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('42','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('43','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('44','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('45','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('46','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('47','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('48','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('49','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('5','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('50','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('51','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('52','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('53','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('6','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('7','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('8','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1'),('9','æ–‡ç« å†…å®¹å†…å®¹å†…å®¹å†…å®¹','æ¥æº','1,2,3','1');
/*!40000 ALTER TABLE `cms_article_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_category`
--

DROP TABLE IF EXISTS `cms_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_category` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `parent_id` varchar(64) NOT NULL COMMENT 'çˆ¶çº§ç¼–å·',
  `parent_ids` varchar(2000) NOT NULL COMMENT 'æ‰€æœ‰çˆ¶çº§ç¼–å·',
  `site_id` varchar(64) DEFAULT '1' COMMENT 'ç«™ç‚¹ç¼–å·',
  `office_id` varchar(64) DEFAULT NULL COMMENT 'å½’å±æœºæ„',
  `module` varchar(20) DEFAULT NULL COMMENT 'æ ç›®æ¨¡å—',
  `name` varchar(100) NOT NULL COMMENT 'æ ç›®åç§°',
  `image` varchar(255) DEFAULT NULL COMMENT 'æ ç›®å›¾ç‰‡',
  `href` varchar(255) DEFAULT NULL COMMENT 'é“¾æ¥',
  `target` varchar(20) DEFAULT NULL COMMENT 'ç›®æ ‡',
  `description` varchar(255) DEFAULT NULL COMMENT 'æè¿°',
  `keywords` varchar(255) DEFAULT NULL COMMENT 'å…³é”®å­—',
  `sort` int(11) DEFAULT '30' COMMENT 'æ’åºï¼ˆå‡åºï¼‰',
  `in_menu` char(1) DEFAULT '1' COMMENT 'æ˜¯å¦åœ¨å¯¼èˆªä¸­æ˜¾ç¤º',
  `in_list` char(1) DEFAULT '1' COMMENT 'æ˜¯å¦åœ¨åˆ†ç±»é¡µä¸­æ˜¾ç¤ºåˆ—è¡¨',
  `show_modes` char(1) DEFAULT '0' COMMENT 'å±•ç°æ–¹å¼',
  `allow_comment` char(1) DEFAULT NULL COMMENT 'æ˜¯å¦å…è®¸è¯„è®º',
  `is_audit` char(1) DEFAULT NULL COMMENT 'æ˜¯å¦éœ€è¦å®¡æ ¸',
  `custom_list_view` varchar(255) DEFAULT NULL COMMENT 'è‡ªå®šä¹‰åˆ—è¡¨è§†å›¾',
  `custom_content_view` varchar(255) DEFAULT NULL COMMENT 'è‡ªå®šä¹‰å†…å®¹è§†å›¾',
  `view_config` text COMMENT 'è§†å›¾é…ç½®',
  `create_by` varchar(64) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `cms_category_parent_id` (`parent_id`),
  KEY `cms_category_module` (`module`),
  KEY `cms_category_name` (`name`),
  KEY `cms_category_sort` (`sort`),
  KEY `cms_category_del_flag` (`del_flag`),
  KEY `cms_category_office_id` (`office_id`),
  KEY `cms_category_site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æ ç›®è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_category`
--

LOCK TABLES `cms_category` WRITE;
/*!40000 ALTER TABLE `cms_category` DISABLE KEYS */;
INSERT INTO `cms_category` VALUES ('1','0','0,','0','1',NULL,'é¡¶çº§æ ç›®',NULL,NULL,NULL,NULL,NULL,0,'1','1','0','0','1',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('10','1','0,1,','1','4','article','æ•°æ®åº“','','','','','',20,'1','1','0','1','0','','','','1','2013-05-27 08:00:00','1','2016-08-04 19:54:25',NULL,'0'),('11','10','0,1,10,','1','4','article','ç½‘ç»œå·¥å…·',NULL,NULL,NULL,NULL,NULL,30,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('12','10','0,1,10,','1','4','article','æµè§ˆå·¥å…·',NULL,NULL,NULL,NULL,NULL,40,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('13','10','0,1,10,','1','4','article','æµè§ˆè¾…åŠ©',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('14','10','0,1,10,','1','4','article','ç½‘ç»œä¼˜åŒ–',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('15','10','0,1,10,','1','4','article','é‚®ä»¶å¤„ç†',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('16','10','0,1,10,','1','4','article','ä¸‹è½½å·¥å…·',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('17','10','0,1,10,','1','4','article','æœç´¢å·¥å…·',NULL,NULL,NULL,NULL,NULL,50,'1','1','2','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('18','1','0,1,','1','5','link','å‹æƒ…é“¾æ¥',NULL,NULL,NULL,NULL,NULL,90,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('19','18','0,1,18,','1','5','link','å¸¸ç”¨ç½‘ç«™',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('2','1','0,1,','1','3','article','JAVA','','','','','',10,'1','1','0','0','1','','','','1','2013-05-27 08:00:00','1','2016-08-04 19:54:16',NULL,'0'),('20','18','0,1,18,','1','5','link','é—¨æˆ·ç½‘ç«™',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('21','18','0,1,18,','1','5','link','è´­ç‰©ç½‘ç«™',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('22','18','0,1,18,','1','5','link','äº¤å‹ç¤¾åŒº',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('23','18','0,1,18,','1','5','link','éŸ³ä¹è§†é¢‘',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('24','1','0,1,','1','6',NULL,'ç™¾åº¦ä¸€ä¸‹',NULL,'http://www.baidu.com','_blank',NULL,NULL,90,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('25','1','0,1,','1','6',NULL,'å…¨æ–‡æ£€ç´¢',NULL,'/search',NULL,NULL,NULL,90,'0','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('26','1','0,1,','2','6','article','æµ‹è¯•æ ç›®',NULL,NULL,NULL,NULL,NULL,90,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('27','1','0,1,','1','6',NULL,'å…¬å…±ç•™è¨€',NULL,'/guestbook',NULL,NULL,NULL,90,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','2','0,1,2,','1','3','article','ç½‘ç«™ç®€ä»‹',NULL,NULL,NULL,NULL,NULL,30,'1','1','0','0','1',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4','2','0,1,2,','1','3','article','å†…éƒ¨æœºæ„',NULL,NULL,NULL,NULL,NULL,40,'1','1','0','0','1',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('5','2','0,1,2,','1','3','article','åœ°æ–¹æœºæ„',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','0','1',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6','1','0,1,','1','3','article','jquery','','','','','',20,'1','1','1','1','0','','','','1','2013-05-27 08:00:00','1','2016-08-04 19:54:41',NULL,'0'),('7','6','0,1,6,','1','3','article','äº§å“è´¨é‡',NULL,NULL,NULL,NULL,NULL,30,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('8','6','0,1,6,','1','3','article','æŠ€æœ¯è´¨é‡',NULL,NULL,NULL,NULL,NULL,40,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('9','6','0,1,6,','1','3','article','å·¥ç¨‹è´¨é‡',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');
/*!40000 ALTER TABLE `cms_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_comment`
--

DROP TABLE IF EXISTS `cms_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_comment` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `category_id` varchar(64) NOT NULL COMMENT 'æ ç›®ç¼–å·',
  `content_id` varchar(64) NOT NULL COMMENT 'æ ç›®å†…å®¹çš„ç¼–å·',
  `title` varchar(255) DEFAULT NULL COMMENT 'æ ç›®å†…å®¹çš„æ ‡é¢˜',
  `content` varchar(255) DEFAULT NULL COMMENT 'è¯„è®ºå†…å®¹',
  `name` varchar(100) DEFAULT NULL COMMENT 'è¯„è®ºå§“å',
  `ip` varchar(100) DEFAULT NULL COMMENT 'è¯„è®ºIP',
  `create_date` datetime NOT NULL COMMENT 'è¯„è®ºæ—¶é—´',
  `audit_user_id` varchar(64) DEFAULT NULL COMMENT 'å®¡æ ¸äºº',
  `audit_date` datetime DEFAULT NULL COMMENT 'å®¡æ ¸æ—¶é—´',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `cms_comment_category_id` (`category_id`),
  KEY `cms_comment_content_id` (`content_id`),
  KEY `cms_comment_status` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='è¯„è®ºè¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_comment`
--

LOCK TABLES `cms_comment` WRITE;
/*!40000 ALTER TABLE `cms_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_guestbook`
--

DROP TABLE IF EXISTS `cms_guestbook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_guestbook` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `type` char(1) NOT NULL COMMENT 'ç•™è¨€åˆ†ç±»',
  `content` varchar(255) NOT NULL COMMENT 'ç•™è¨€å†…å®¹',
  `name` varchar(100) NOT NULL COMMENT 'å§“å',
  `email` varchar(100) NOT NULL COMMENT 'é‚®ç®±',
  `phone` varchar(100) NOT NULL COMMENT 'ç”µè¯',
  `workunit` varchar(100) NOT NULL COMMENT 'å•ä½',
  `ip` varchar(100) NOT NULL COMMENT 'IP',
  `create_date` datetime NOT NULL COMMENT 'ç•™è¨€æ—¶é—´',
  `re_user_id` varchar(64) DEFAULT NULL COMMENT 'å›å¤äºº',
  `re_date` datetime DEFAULT NULL COMMENT 'å›å¤æ—¶é—´',
  `re_content` varchar(100) DEFAULT NULL COMMENT 'å›å¤å†…å®¹',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `cms_guestbook_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ç•™è¨€æ¿';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_guestbook`
--

LOCK TABLES `cms_guestbook` WRITE;
/*!40000 ALTER TABLE `cms_guestbook` DISABLE KEYS */;
/*!40000 ALTER TABLE `cms_guestbook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_link`
--

DROP TABLE IF EXISTS `cms_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_link` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `category_id` varchar(64) NOT NULL COMMENT 'æ ç›®ç¼–å·',
  `title` varchar(255) NOT NULL COMMENT 'é“¾æ¥åç§°',
  `color` varchar(50) DEFAULT NULL COMMENT 'æ ‡é¢˜é¢œè‰²',
  `image` varchar(255) DEFAULT NULL COMMENT 'é“¾æ¥å›¾ç‰‡',
  `href` varchar(255) DEFAULT NULL COMMENT 'é“¾æ¥åœ°å€',
  `weight` int(11) DEFAULT '0' COMMENT 'æƒé‡ï¼Œè¶Šå¤§è¶Šé å‰',
  `weight_date` datetime DEFAULT NULL COMMENT 'æƒé‡æœŸé™',
  `create_by` varchar(64) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `cms_link_category_id` (`category_id`),
  KEY `cms_link_title` (`title`),
  KEY `cms_link_del_flag` (`del_flag`),
  KEY `cms_link_weight` (`weight`),
  KEY `cms_link_create_by` (`create_by`),
  KEY `cms_link_update_date` (`update_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='å‹æƒ…é“¾æ¥';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_link`
--

LOCK TABLES `cms_link` WRITE;
/*!40000 ALTER TABLE `cms_link` DISABLE KEYS */;
INSERT INTO `cms_link` VALUES ('1','19','JeeSite',NULL,NULL,'http://thinkgem.github.com/jeesite',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('10','22','58åŒåŸ',NULL,NULL,'http://www.58.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('11','23','è§†é¢‘å¤§å…¨',NULL,NULL,'http://v.360.cn/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('12','23','å‡¤å‡°ç½‘',NULL,NULL,'http://www.ifeng.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','19','ThinkGem',NULL,NULL,'http://thinkgem.iteye.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','19','ç™¾åº¦ä¸€ä¸‹',NULL,NULL,'http://www.baidu.com',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4','19','è°·æ­Œæœç´¢',NULL,NULL,'http://www.google.com',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('5','20','æ–°æµªç½‘',NULL,NULL,'http://www.sina.com.cn',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6','20','è…¾è®¯ç½‘',NULL,NULL,'http://www.qq.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('7','21','æ·˜å®ç½‘',NULL,NULL,'http://www.taobao.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('8','21','æ–°åç½‘',NULL,NULL,'http://www.xinhuanet.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('9','22','èµ¶é›†ç½‘',NULL,NULL,'http://www.ganji.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');
/*!40000 ALTER TABLE `cms_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_site`
--

DROP TABLE IF EXISTS `cms_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_site` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `name` varchar(100) NOT NULL COMMENT 'ç«™ç‚¹åç§°',
  `title` varchar(100) NOT NULL COMMENT 'ç«™ç‚¹æ ‡é¢˜',
  `logo` varchar(255) DEFAULT NULL COMMENT 'ç«™ç‚¹Logo',
  `domain` varchar(255) DEFAULT NULL COMMENT 'ç«™ç‚¹åŸŸå',
  `description` varchar(255) DEFAULT NULL COMMENT 'æè¿°',
  `keywords` varchar(255) DEFAULT NULL COMMENT 'å…³é”®å­—',
  `theme` varchar(255) DEFAULT 'default' COMMENT 'ä¸»é¢˜',
  `copyright` text COMMENT 'ç‰ˆæƒä¿¡æ¯',
  `custom_index_view` varchar(255) DEFAULT NULL COMMENT 'è‡ªå®šä¹‰ç«™ç‚¹é¦–é¡µè§†å›¾',
  `create_by` varchar(64) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `cms_site_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ç«™ç‚¹è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_site`
--

LOCK TABLES `cms_site` WRITE;
/*!40000 ALTER TABLE `cms_site` DISABLE KEYS */;
INSERT INTO `cms_site` VALUES ('1','é»˜è®¤ç«™ç‚¹','JeeSite Web',NULL,NULL,'JeeSite','JeeSite','basic','Copyright &copy; 2012-2013 <a href=\'http://thinkgem.iteye.com\' target=\'_blank\'>ThinkGem</a> - Powered By <a href=\'https://github.com/thinkgem/jeesite\' target=\'_blank\'>JeeSite</a> V1.0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','å­ç«™ç‚¹æµ‹è¯•','JeeSite Subsite',NULL,NULL,'JeeSite subsite','JeeSite subsite','basic','Copyright &copy; 2012-2013 <a href=\'http://thinkgem.iteye.com\' target=\'_blank\'>ThinkGem</a> - Powered By <a href=\'https://github.com/thinkgem/jeesite\' target=\'_blank\'>JeeSite</a> V1.0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');
/*!40000 ALTER TABLE `cms_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_scheme`
--

DROP TABLE IF EXISTS `gen_scheme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_scheme` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `name` varchar(200) DEFAULT NULL COMMENT 'åç§°',
  `category` varchar(2000) DEFAULT NULL COMMENT 'åˆ†ç±»',
  `package_name` varchar(500) DEFAULT NULL COMMENT 'ç”ŸæˆåŒ…è·¯å¾„',
  `module_name` varchar(30) DEFAULT NULL COMMENT 'ç”Ÿæˆæ¨¡å—å',
  `sub_module_name` varchar(30) DEFAULT NULL COMMENT 'ç”Ÿæˆå­æ¨¡å—å',
  `function_name` varchar(500) DEFAULT NULL COMMENT 'ç”ŸæˆåŠŸèƒ½å',
  `function_name_simple` varchar(100) DEFAULT NULL COMMENT 'ç”ŸæˆåŠŸèƒ½åï¼ˆç®€å†™ï¼‰',
  `function_author` varchar(100) DEFAULT NULL COMMENT 'ç”ŸæˆåŠŸèƒ½ä½œè€…',
  `gen_table_id` varchar(200) DEFAULT NULL COMMENT 'ç”Ÿæˆè¡¨ç¼–å·',
  `create_by` varchar(64) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°ï¼ˆ0ï¼šæ­£å¸¸ï¼›1ï¼šåˆ é™¤ï¼‰',
  PRIMARY KEY (`id`),
  KEY `gen_scheme_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ç”Ÿæˆæ–¹æ¡ˆ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_scheme`
--

LOCK TABLES `gen_scheme` WRITE;
/*!40000 ALTER TABLE `gen_scheme` DISABLE KEYS */;
INSERT INTO `gen_scheme` VALUES ('034ce50d45bb4320be45d38511c043d9','ä¸ªäººåŸºç¡€ä¿¡æ¯','curd','com.thinkgem.jeesite.modules','resume','','ä¸ªäººåŸºç¡€ä¿¡æ¯','ä¸ªäººåŸºç¡€ä¿¡æ¯','zhaojf','229400ebd07249a6815a37ee0dce4710','1','2016-07-21 17:21:00','1','2016-07-21 17:21:00','','0'),('35a13dc260284a728a270db3f382664b','æ ‘ç»“æ„','treeTable','com.thinkgem.jeesite.modules','test',NULL,'æ ‘ç»“æ„ç”Ÿæˆ','æ ‘ç»“æ„','ThinkGem','f6e4dafaa72f4c509636484715f33a96','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('74a4d81ea77d4abab72374df0ed90fe6','ä¸ªäººåŸºç¡€ä¿¡æ¯','curd','com.thinkgem.jeesite.modules','resume','','ä¸ªäººåŸºç¡€ä¿¡æ¯','resume','zhaojf','341adfbbd1894a089be1196396428e20','1','2016-07-21 15:48:05','1','2016-07-21 15:48:05','','1'),('86d3f4e9c99c4b90a3d1feee1154ed2a','å¾®ä¿¡ç”¨æˆ·','curd','com.thinkgem.jeesite.modules','wechat','','å¾®ä¿¡ç”¨æˆ·','å¾®ä¿¡ç”¨æˆ·','zhaojf','6a1f05b34c3a46a6b0ef42f09c4271c8','1','2016-07-18 19:42:47','1','2016-07-18 19:42:47','','0'),('9c9de9db6da743bb899036c6546061ac','å•è¡¨','curd','com.thinkgem.jeesite.modules','test',NULL,'å•è¡¨ç”Ÿæˆ','å•è¡¨','ThinkGem','aef6f1fc948f4c9ab1c1b780bc471cc2','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('a5834c2a24734b07b815e3e0a660b22c','ç»‘å®šç”¨æˆ·','curd','com.thinkgem.jeesite.modules','account','','ç»‘å®šç”¨æˆ·','ç»‘å®šç”¨æˆ·','zhaojf','1e4e3d1a4a61423a86949011843ec4ed','1','2016-07-19 11:05:41','1','2016-07-19 11:05:48','','1'),('b6448a40d51344beb53f084d069abae9','ç­¾åˆ°ç®¡ç†','curd','com.thinkgem.jeesite.modules','qiandao','','ç­¾åˆ°ç®¡ç†','ç­¾åˆ°æˆåŠŸ','773152','dbd4126e43eb4978b1e3099e920b4416','1','2016-08-01 17:51:33','1','2016-08-01 17:56:52','','0'),('baed2816cbf54f1799287b4ee2cbb125','ä¸ªäººåŸºç¡€ä¿¡æ¯','curd','com.thinkgem.jeesite.modules','resume','','ä¸ªäººåŸºç¡€ä¿¡æ¯','ä¸ªäººåŸºç¡€ä¿¡æ¯','zhaojf','c3d9205399914896b72fea6cd962cd99','1','2016-07-21 16:26:35','1','2016-07-21 16:26:35','','1'),('d1373b3d3b4f447cb72dd902e17b0196','ä¸ªäººåŸºç¡€ä¿¡æ¯','curd','com.thinkgem.jeesite.modules','resume','','ä¸ªäººåŸºç¡€ä¿¡æ¯','ä¸ªäººåŸºç¡€ä¿¡æ¯','zhaojf','3d721d0d5c424b5fac3c1ab702cfaf77','1','2016-07-21 16:33:42','1','2016-07-21 16:40:58','','1'),('e6d905fd236b46d1af581dd32bdfb3b0','ä¸»å­è¡¨','curd_many','com.thinkgem.jeesite.modules','test',NULL,'ä¸»å­è¡¨ç”Ÿæˆ','ä¸»å­è¡¨','ThinkGem','43d6d5acffa14c258340ce6765e46c6f','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('f3e61c6fb03c429f81ddede407a35578','å¾®ä¿¡åœ°ç†ä½ç½®','curd','com.thinkgem.jeesite.modules','location','','å¾®ä¿¡åœ°ç†ä½ç½®','å¾®ä¿¡åœ°ç†ä½ç½®','zhaojf','1c68860c5701474788d4627b05281a24','1','2016-07-18 20:41:28','1','2016-07-18 20:41:28','','0'),('fc5b178223ef45c1b41079659c4f823d','ç»‘å®šç”¨æˆ·','curd','com.thinkgem.jeesite.modules','account','','ç»‘å®šç”¨æˆ·','ç»‘å®šç”¨æˆ·','zhaojf','667b900e55b04031bd25301c0589bdf2','1','2016-07-19 11:17:10','1','2016-07-19 11:17:10','','1');
/*!40000 ALTER TABLE `gen_scheme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_table` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `name` varchar(200) DEFAULT NULL COMMENT 'åç§°',
  `comments` varchar(500) DEFAULT NULL COMMENT 'æè¿°',
  `class_name` varchar(100) DEFAULT NULL COMMENT 'å®ä½“ç±»åç§°',
  `parent_table` varchar(200) DEFAULT NULL COMMENT 'å…³è”çˆ¶è¡¨',
  `parent_table_fk` varchar(100) DEFAULT NULL COMMENT 'å…³è”çˆ¶è¡¨å¤–é”®',
  `create_by` varchar(64) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°ï¼ˆ0ï¼šæ­£å¸¸ï¼›1ï¼šåˆ é™¤ï¼‰',
  PRIMARY KEY (`id`),
  KEY `gen_table_name` (`name`),
  KEY `gen_table_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ä¸šåŠ¡è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
INSERT INTO `gen_table` VALUES ('1c68860c5701474788d4627b05281a24','wechat_location','wechat_location','WechatLocation','','','1','2016-07-18 20:40:48','1','2016-07-18 20:40:48','','0'),('1e4e3d1a4a61423a86949011843ec4ed','uc_account','uc_account','UcAccount','','','1','2016-07-19 11:04:55','1','2016-07-19 11:04:55','','1'),('229400ebd07249a6815a37ee0dce4710','resume','resume','Resume','','','1','2016-07-21 17:20:40','1','2016-07-21 17:20:40','','1'),('341adfbbd1894a089be1196396428e20','resume','resume','Resume','','','1','2016-07-21 15:47:09','1','2016-07-21 15:47:09','','1'),('3d721d0d5c424b5fac3c1ab702cfaf77','resume','ä¸ªäººåŸºç¡€ä¿¡æ¯','Resume','','','1','2016-07-21 16:32:44','1','2016-07-21 16:32:44','','1'),('4146c299178d44dfb125f9637179fd9c','uc_members','uc_members','UcMembers','','','1','2016-07-19 11:00:49','1','2016-07-19 11:00:49','','1'),('43d6d5acffa14c258340ce6765e46c6f','test_data_main','ä¸šåŠ¡æ•°æ®è¡¨','TestDataMain',NULL,NULL,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('667b900e55b04031bd25301c0589bdf2','uc_account','uc_account','UcAccount','','','1','2016-07-19 11:16:43','1','2016-07-19 11:16:43','','1'),('6a1f05b34c3a46a6b0ef42f09c4271c8','wechat_member','wechat_member','WechatMember','','','1','2016-07-18 19:41:42','1','2016-07-18 19:41:42','','0'),('6e05c389f3c6415ea34e55e9dfb28934','test_data_child','ä¸šåŠ¡æ•°æ®å­è¡¨','TestDataChild','test_data_main','test_data_main_id','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('aef6f1fc948f4c9ab1c1b780bc471cc2','test_data','ä¸šåŠ¡æ•°æ®è¡¨','TestData',NULL,NULL,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('c3d9205399914896b72fea6cd962cd99','resume','resume','Resume','','','1','2016-07-21 16:25:47','1','2016-07-21 16:25:47','','1'),('dbd4126e43eb4978b1e3099e920b4416','hr_qiandao','hr_qiandao','Qiandao','','','1','2016-08-01 17:50:51','1','2016-08-01 17:56:14','','0'),('f6e4dafaa72f4c509636484715f33a96','test_tree','æ ‘ç»“æ„è¡¨','TestTree',NULL,NULL,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0');
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_table_column` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `gen_table_id` varchar(64) DEFAULT NULL COMMENT 'å½’å±è¡¨ç¼–å·',
  `name` varchar(200) DEFAULT NULL COMMENT 'åç§°',
  `comments` varchar(500) DEFAULT NULL COMMENT 'æè¿°',
  `jdbc_type` varchar(100) DEFAULT NULL COMMENT 'åˆ—çš„æ•°æ®ç±»å‹çš„å­—èŠ‚é•¿åº¦',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVAç±»å‹',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVAå­—æ®µå',
  `is_pk` char(1) DEFAULT NULL COMMENT 'æ˜¯å¦ä¸»é”®',
  `is_null` char(1) DEFAULT NULL COMMENT 'æ˜¯å¦å¯ä¸ºç©º',
  `is_insert` char(1) DEFAULT NULL COMMENT 'æ˜¯å¦ä¸ºæ’å…¥å­—æ®µ',
  `is_edit` char(1) DEFAULT NULL COMMENT 'æ˜¯å¦ç¼–è¾‘å­—æ®µ',
  `is_list` char(1) DEFAULT NULL COMMENT 'æ˜¯å¦åˆ—è¡¨å­—æ®µ',
  `is_query` char(1) DEFAULT NULL COMMENT 'æ˜¯å¦æŸ¥è¯¢å­—æ®µ',
  `query_type` varchar(200) DEFAULT NULL COMMENT 'æŸ¥è¯¢æ–¹å¼ï¼ˆç­‰äºã€ä¸ç­‰äºã€å¤§äºã€å°äºã€èŒƒå›´ã€å·¦LIKEã€å³LIKEã€å·¦å³LIKEï¼‰',
  `show_type` varchar(200) DEFAULT NULL COMMENT 'å­—æ®µç”Ÿæˆæ–¹æ¡ˆï¼ˆæ–‡æœ¬æ¡†ã€æ–‡æœ¬åŸŸã€ä¸‹æ‹‰æ¡†ã€å¤é€‰æ¡†ã€å•é€‰æ¡†ã€å­—å…¸é€‰æ‹©ã€äººå‘˜é€‰æ‹©ã€éƒ¨é—¨é€‰æ‹©ã€åŒºåŸŸé€‰æ‹©ï¼‰',
  `dict_type` varchar(200) DEFAULT NULL COMMENT 'å­—å…¸ç±»å‹',
  `settings` varchar(2000) DEFAULT NULL COMMENT 'å…¶å®ƒè®¾ç½®ï¼ˆæ‰©å±•å­—æ®µJSONï¼‰',
  `sort` decimal(10,0) DEFAULT NULL COMMENT 'æ’åºï¼ˆå‡åºï¼‰',
  `create_by` varchar(64) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°ï¼ˆ0ï¼šæ­£å¸¸ï¼›1ï¼šåˆ é™¤ï¼‰',
  PRIMARY KEY (`id`),
  KEY `gen_table_column_table_id` (`gen_table_id`),
  KEY `gen_table_column_name` (`name`),
  KEY `gen_table_column_sort` (`sort`),
  KEY `gen_table_column_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ä¸šåŠ¡è¡¨å­—æ®µ';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
INSERT INTO `gen_table_column` VALUES ('00ace65cd68743a6a480d4643cea0dde','c3d9205399914896b72fea6cd962cd99','email','email','varchar(80)','String','email','0','1','1','1','0','0','=','input','',NULL,130,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('02313878526c4c3bb5e5cd8976f14fc2','229400ebd07249a6815a37ee0dce4710','name','å§“å','varchar(20)','String','name','0','0','1','1','1','1','like','input','',NULL,20,'1','2016-07-21 17:20:40','1','2016-07-21 17:20:40',NULL,'1'),('02c6f29873094e17b5d910acd443aa79','c3d9205399914896b72fea6cd962cd99','ali_talk','æ—ºæ—ºid','varchar(100)','String','aliTalk','0','1','1','1','0','0','=','input','',NULL,320,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('02d95480a7234ff38117471ed9c0b8f4','3d721d0d5c424b5fac3c1ab702cfaf77','stature','èº«é«˜','int(11)','String','stature','0','1','1','1','0','0','=','input','',NULL,280,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('0622352dff0f40b1945060ed86bd8f30','1e4e3d1a4a61423a86949011843ec4ed','status','çŠ¶æ€','char(1)','String','status','0','0','1','1','0','0','=','input','',NULL,90,'1','2016-07-19 11:04:55','1','2016-07-19 11:04:55',NULL,'1'),('08ed55c098594a539b448be7de08508f','1c68860c5701474788d4627b05281a24','remarks','å¤‡æ³¨ä¿¡æ¯','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,120,'1','2016-07-18 20:40:48','1','2016-07-18 20:40:48',NULL,'0'),('0902a0cb3e8f434280c20e9d771d0658','aef6f1fc948f4c9ab1c1b780bc471cc2','sex','æ€§åˆ«','char(1)','String','sex','0','1','1','1','1','1','=','radiobox','sex',NULL,6,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('0b35175086ab42df99777df229e3f84c','229400ebd07249a6815a37ee0dce4710','birthday','å‡ºç”Ÿæ—¥æœŸ','varchar(12)','String','birthday','0','1','1','1','0','0','=','dateselect','',NULL,50,'1','2016-07-21 17:20:40','1','2016-07-21 17:20:40',NULL,'1'),('0d12f0d083d34ff2a5a9115a4682f512','c3d9205399914896b72fea6cd962cd99','status','çŠ¶æ€','char(1)','String','status','0','0','1','1','0','0','=','select','del_flag',NULL,360,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('0e7c7dbc118a4f85a0ae617732bb2e3b','6a1f05b34c3a46a6b0ef42f09c4271c8','status','å·²å…³æ³¨','char(1)','String','status','0','0','1','1','0','0','=','input','',NULL,200,'1','2016-07-18 19:41:42','1','2016-07-18 19:41:42',NULL,'0'),('0f1f7f888e924cea9cea752d3f57c403','341adfbbd1894a089be1196396428e20','marrige','å©šå§»çŠ¶å†µ','int(11)','String','marrige','0','1','1','1','0','0','=','input','',NULL,290,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('101474de94794b78abdd38917f4e88b6','3d721d0d5c424b5fac3c1ab702cfaf77','current_situation','æ±‚èŒçŠ¶æ€','int(11)','String','currentSituation','0','1','1','1','0','0','=','input','',NULL,160,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('103fc05c88ff40639875c2111881996a','aef6f1fc948f4c9ab1c1b780bc471cc2','create_date','åˆ›å»ºæ—¶é—´','timestamp(6)','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect',NULL,NULL,9,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('114b76185664498eb1966873eaa5a7c1','229400ebd07249a6815a37ee0dce4710','salary','ç›®å‰å¹´è–ª','int(11)','String','salary','0','1','1','1','0','0','=','input','',NULL,110,'1','2016-07-21 17:20:40','1','2016-07-21 17:20:40',NULL,'1'),('12fa38dd986e41908f7fefa5839d1220','6e05c389f3c6415ea34e55e9dfb28934','create_by','åˆ›å»ºè€…','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input',NULL,NULL,4,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('13c13d252d324578950a61254e6cca2f','c3d9205399914896b72fea6cd962cd99','headimg','ä¸ªäººå¤´åƒ','blob','String','headimg','0','1','1','1','0','0','=','fileselect','',NULL,40,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('13c8cd81627948be85ecf83b46abe958','1c68860c5701474788d4627b05281a24','openid','ç”¨æˆ·çš„æ ‡è¯†ï¼Œå¯¹å½“å‰å…¬ä¼—å·å”¯ä¸€','varchar(200)','String','openid','0','0','1','1','0','0','=','input','',NULL,20,'1','2016-07-18 20:40:48','1','2016-07-18 20:40:48',NULL,'0'),('14dd9f38dd484eeba07001fcb5428e4b','341adfbbd1894a089be1196396428e20','address','åœ°å€','varchar(150)','String','address','0','1','1','1','0','0','=','input','',NULL,340,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('155eee0421ee4664bfc51a61d756921a','3d721d0d5c424b5fac3c1ab702cfaf77','month_of_birthday','å‡ºç”Ÿæ—¥æœŸ-æœˆ','char(2)','String','monthOfBirthday','0','1','1','1','0','0','=','input','',NULL,70,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('15e73323dde44b9b9e6fcbbde8b0b180','6a1f05b34c3a46a6b0ef42f09c4271c8','headimgurl','ç”¨æˆ·å¤´åƒï¼Œæœ€åä¸€ä¸ªæ•°å€¼ä»£è¡¨æ­£æ–¹å½¢å¤´åƒå¤§å°ï¼ˆæœ‰0ã€46ã€64ã€96ã€132æ•°å€¼å¯é€‰ï¼Œ0ä»£è¡¨640*640æ­£æ–¹å½¢å¤´åƒï¼‰ï¼Œç”¨æˆ·æ²¡æœ‰å¤´åƒæ—¶è¯¥é¡¹ä¸ºç©ºã€‚è‹¥ç”¨æˆ·æ›´æ¢å¤´åƒï¼ŒåŸæœ‰å¤´åƒURLå°†å¤±æ•ˆã€‚','varchar(200)','String','headimgurl','0','1','1','1','0','0','=','input','',NULL,100,'1','2016-07-18 19:41:42','1','2016-07-18 19:41:42',NULL,'0'),('1627961650bc42d484f2f7072a18c43d','1c68860c5701474788d4627b05281a24','update_date','æ›´æ–°æ—¶é—´','datetime','java.util.Date','updateDate','0','1','1','1','1','0','=','dateselect','',NULL,110,'1','2016-07-18 20:40:48','1','2016-07-18 20:40:48',NULL,'0'),('17bfba3b5a4b4d2ca1ab09306f1830f3','c3d9205399914896b72fea6cd962cd99','year_of_birthday','å‡ºç”Ÿæ—¥æœŸ-å¹´','char(4)','String','yearOfBirthday','0','1','1','1','0','0','=','input','',NULL,60,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('195ee9241f954d008fe01625f4adbfef','f6e4dafaa72f4c509636484715f33a96','create_by','åˆ›å»ºè€…','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input',NULL,NULL,6,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('19c6478b8ff54c60910c2e4fc3d27503','43d6d5acffa14c258340ce6765e46c6f','id','ç¼–å·','varchar2(64)','String','id','1','0','1','0','0','0','=','input',NULL,NULL,1,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('1ac6562f753d4e599693840651ab2bf7','43d6d5acffa14c258340ce6765e46c6f','in_date','åŠ å…¥æ—¥æœŸ','date(7)','java.util.Date','inDate','0','1','1','1','0','0','=','dateselect',NULL,NULL,7,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('1ad716aaa3084fd186956c097982ef86','4146c299178d44dfb125f9637179fd9c','email','email','char(32)','String','email','0','0','1','1','0','0','=','input','',NULL,60,'1','2016-07-19 11:00:49','1','2016-07-19 11:00:49',NULL,'1'),('1b20e6624a8a49209cd7022fcf300679','667b900e55b04031bd25301c0589bdf2','phone','æ‰‹æœºå·','varchar(200)','String','phone','0','1','1','1','0','0','=','input','',NULL,30,'1','2016-07-19 11:16:43','1','2016-07-19 11:16:43',NULL,'1'),('1b8eb55f65284fa6b0a5879b6d8ad3ec','aef6f1fc948f4c9ab1c1b780bc471cc2','in_date','åŠ å…¥æ—¥æœŸ','date(7)','java.util.Date','inDate','0','1','1','1','0','1','between','dateselect',NULL,NULL,7,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('1bde319c00094876893a86dde7f4f440','c3d9205399914896b72fea6cd962cd99','student_group','å·¥ä½œç»éªŒ','int(11)','String','studentGroup','0','1','1','1','0','0','=','input','',NULL,350,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('1bdfa873914a4a77a139e4c0f58bb0b5','3d721d0d5c424b5fac3c1ab702cfaf77','fpextension','å…¬å¸ç”µè¯-åˆ†æœº','char(10)','String','fpextension','0','1','1','1','0','0','=','input','',NULL,210,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('1d5ca4d114be41e99f8dc42a682ba609','aef6f1fc948f4c9ab1c1b780bc471cc2','user_id','å½’å±ç”¨æˆ·','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','user.id|name','0','1','1','1','1','1','=','userselect',NULL,NULL,2,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('1f26f289701c4ca184d285d1a13a4a69','dbd4126e43eb4978b1e3099e920b4416','create_by','åˆ›å»ºè€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,60,'1','2016-08-01 17:50:52','1','2016-08-01 17:56:14',NULL,'0'),('20a36cf1c6b644e187d0e3ebdd5b6272','4146c299178d44dfb125f9637179fd9c','regdate','regdate','int(10) unsigned','String','regdate','0','0','1','1','0','0','=','input','',NULL,100,'1','2016-07-19 11:00:49','1','2016-07-19 11:00:49',NULL,'1'),('21756504ffdc487eb167a823f89c0c06','43d6d5acffa14c258340ce6765e46c6f','update_by','æ›´æ–°è€…','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input',NULL,NULL,10,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('22fa6d874a274290bb1c24ef3319ddc8','341adfbbd1894a089be1196396428e20','hpcity','å®¶åº­ç”µè¯-åŒºå·','char(5)','String','hpcity','0','1','1','1','0','0','=','input','',NULL,230,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('240e09e2b1104414a20feefd7cfd9b1d','229400ebd07249a6815a37ee0dce4710','mobile','æ‰‹æœºå·ç ','varchar(20)','String','mobile','0','1','1','1','0','0','=','input','',NULL,130,'1','2016-07-21 17:20:40','1','2016-07-21 17:20:40',NULL,'1'),('24196287e85b4735a6cf967b6a14d8c5','c3d9205399914896b72fea6cd962cd99','month_of_birthday','å‡ºç”Ÿæ—¥æœŸ-æœˆ','char(2)','String','monthOfBirthday','0','1','1','1','0','0','=','input','',NULL,70,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('243b3c8cf7f0459c899bd4ad3f7077a9','229400ebd07249a6815a37ee0dce4710','current_situation','æ±‚èŒçŠ¶æ€','int(11)','String','currentSituation','0','1','1','1','0','0','=','input','',NULL,120,'1','2016-07-21 17:20:40','1','2016-07-21 17:20:40',NULL,'1'),('244237ac6cd24238a9acd2892c559bf0','229400ebd07249a6815a37ee0dce4710','ali_talk','æ—ºæ—ºid','varchar(100)','String','aliTalk','0','1','1','1','0','0','=','input','',NULL,200,'1','2016-07-21 17:20:40','1','2016-07-21 17:20:40',NULL,'1'),('24bbdc0a555e4412a106ab1c5f03008e','f6e4dafaa72f4c509636484715f33a96','parent_ids','æ‰€æœ‰çˆ¶çº§ç¼–å·','varchar2(2000)','String','parentIds','0','0','1','1','0','0','like','input',NULL,NULL,3,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('25086a9d312145cdaae5052aa80ff5e3','667b900e55b04031bd25301c0589bdf2','create_date','åˆ›å»ºæ—¶é—´','datetime','java.util.Date','createDate','0','1','1','0','0','0','=','dateselect','',NULL,60,'1','2016-07-19 11:16:43','1','2016-07-19 11:16:43',NULL,'1'),('26d7674ac1eb4157823d41c4354b437c','4146c299178d44dfb125f9637179fd9c','username','username','char(15)','String','username','0','0','1','1','0','0','=','input','',NULL,20,'1','2016-07-19 11:00:49','1','2016-07-19 11:00:49',NULL,'1'),('2af9c9ac0ba14711b1d0c93740c0cbdb','341adfbbd1894a089be1196396428e20','headimgurl','ä¸ªäººå¤´åƒ','varchar(200)','String','headimgurl','0','1','1','1','0','0','=','input','',NULL,40,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('2afce59c3a8e4eeab47d2243a4f07a30','6a1f05b34c3a46a6b0ef42f09c4271c8','remarks','å¤‡æ³¨ä¿¡æ¯','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,190,'1','2016-07-18 19:41:42','1','2016-07-18 19:41:42',NULL,'0'),('2b4aade3c76c4fd6ad7e4e7c73fb3bef','229400ebd07249a6815a37ee0dce4710','zip_code','é‚®ç¼–','char(6)','String','zipCode','0','1','1','1','0','0','=','input','',NULL,190,'1','2016-07-21 17:20:40','1','2016-07-21 17:20:40',NULL,'1'),('2f148fac928b440c92b6961d2578eb30','1e4e3d1a4a61423a86949011843ec4ed','truename','çœŸå®å§“å','varchar(200)','String','truename','0','1','1','1','0','0','=','input','',NULL,30,'1','2016-07-19 11:04:55','1','2016-07-19 11:04:55',NULL,'1'),('3072a16596384a3b98825769b256edc4','3d721d0d5c424b5fac3c1ab702cfaf77','home_page','ä¸ªäººä¸»é¡µ','varchar(200)','String','homePage','0','1','1','1','0','0','=','input','',NULL,330,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('312abc44c0ba42889b98e14869c5c9cb','667b900e55b04031bd25301c0589bdf2','update_date','æ›´æ–°æ—¶é—´','datetime','java.util.Date','updateDate','0','1','1','1','1','0','=','dateselect','',NULL,80,'1','2016-07-19 11:16:43','1','2016-07-19 11:16:43',NULL,'1'),('33152ce420904594b3eac796a27f0560','6e05c389f3c6415ea34e55e9dfb28934','id','ç¼–å·','varchar2(64)','String','id','1','0','1','0','0','0','=','input',NULL,NULL,1,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('33c217d2f32b4f3a8491a994267d0139','c3d9205399914896b72fea6cd962cd99','work_year','å·¥ä½œå¹´é™','int(11)','String','workYear','0','1','1','1','0','0','=','input','',NULL,90,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('35af241859624a01917ab64c3f4f0813','aef6f1fc948f4c9ab1c1b780bc471cc2','del_flag','åˆ é™¤æ ‡è®°ï¼ˆ0ï¼šæ­£å¸¸ï¼›1ï¼šåˆ é™¤ï¼‰','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,13,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('36a5bfa8e549499a81cbb759746a2d33','4146c299178d44dfb125f9637179fd9c','uid','uid','mediumint(8) unsigned','String','uid','1','0','1','1','0','0','=','input','',NULL,10,'1','2016-07-19 11:00:49','1','2016-07-19 11:00:49',NULL,'1'),('36da3857cf504ebdad23e0e8a33186e9','341adfbbd1894a089be1196396428e20','hpnumber','å®¶åº­ç”µè¯-ç”µè¯å·ç ','char(20)','String','hpnumber','0','1','1','1','0','0','=','input','',NULL,240,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('375f56d9556e481ead176a1dd8911155','1c68860c5701474788d4627b05281a24','precision','åœ°ç†ä½ç½®ç²¾åº¦','varchar(200)','String','precision','0','1','1','1','0','0','=','input','',NULL,30,'1','2016-07-18 20:40:48','1','2016-07-18 20:40:48',NULL,'0'),('38e274f3d7434717bf472642a159076f','3d721d0d5c424b5fac3c1ab702cfaf77','salary','ç›®å‰å¹´è–ª','int(11)','String','salary','0','1','1','1','0','0','=','input','',NULL,140,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('398b4a03f06940bfb979ca574e1911e3','aef6f1fc948f4c9ab1c1b780bc471cc2','create_by','åˆ›å»ºè€…','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input',NULL,NULL,8,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('3a70b55133e64596982473c8f3706e6b','c3d9205399914896b72fea6cd962cd99','qq_talk','qqå·','varchar(20)','String','qqTalk','0','1','1','1','0','0','=','input','',NULL,300,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('3a7cf23ae48a4c849ceb03feffc7a524','43d6d5acffa14c258340ce6765e46c6f','area_id','å½’å±åŒºåŸŸ','nvarchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.Area','area.id|name','0','1','1','1','0','0','=','areaselect',NULL,NULL,4,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('3c5a9f8d26dc4908b448f3e8a0b41638','c3d9205399914896b72fea6cd962cd99','current_situation','æ±‚èŒçŠ¶æ€','int(11)','String','currentSituation','0','1','1','1','0','0','=','input','',NULL,160,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('3d9c32865bb44e85af73381df0ffbf3d','43d6d5acffa14c258340ce6765e46c6f','update_date','æ›´æ–°æ—¶é—´','timestamp(6)','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect',NULL,NULL,11,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('3db756271ca94753865075bc282f45bc','341adfbbd1894a089be1196396428e20','fpnumber','å…¬å¸ç”µè¯-æ€»æœºå·ç ','char(20)','String','fpnumber','0','1','1','1','0','0','=','input','',NULL,200,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('3e8da15e6a0b4639950126d73fa44512','3d721d0d5c424b5fac3c1ab702cfaf77','fpcity','å…¬å¸ç”µè¯-åŒºå·','char(5)','String','fpcity','0','1','1','1','0','0','=','input','',NULL,190,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('40f6c4df096b43b5a1f68c84edc65328','3d721d0d5c424b5fac3c1ab702cfaf77','status','çŠ¶æ€','char(1)','String','status','0','0','1','1','0','0','=','select','del_flag',NULL,360,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('410937716b5541a9aaf9778c1cfcf0d0','c3d9205399914896b72fea6cd962cd99','name','å§“å','varchar(20)','String','name','0','1','1','1','1','1','like','input','',NULL,20,'1','2016-07-21 16:25:47','1','2016-07-21 16:25:47',NULL,'1'),('416c76d2019b4f76a96d8dc3a8faf84c','f6e4dafaa72f4c509636484715f33a96','update_date','æ›´æ–°æ—¶é—´','timestamp(6)','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect',NULL,NULL,9,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('4175f707deae43479e229ca9c7042f24','3d721d0d5c424b5fac3c1ab702cfaf77','name','å§“å','varchar(20)','String','name','0','1','1','1','1','1','like','input','',NULL,20,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('447469e5138e4c8d8ffbee9fe3a98615','dbd4126e43eb4978b1e3099e920b4416','del_flag','åˆ é™¤æ ‡è®°','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,110,'1','2016-08-01 17:50:52','1','2016-08-01 17:56:14',NULL,'0'),('46a271d30cef4e5fb3e52f6dfe620599','3d721d0d5c424b5fac3c1ab702cfaf77','hpnation','å®¶åº­ç”µè¯','char(5)','String','hpnation','0','1','1','1','0','0','=','input','',NULL,220,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('46b2038347e843b387c5256450a426d0','c3d9205399914896b72fea6cd962cd99','salary','ç›®å‰å¹´è–ª','int(11)','String','salary','0','1','1','1','0','0','=','input','',NULL,140,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('46e6d8283270493687085d29efdecb05','f6e4dafaa72f4c509636484715f33a96','del_flag','åˆ é™¤æ ‡è®°ï¼ˆ0ï¼šæ­£å¸¸ï¼›1ï¼šåˆ é™¤ï¼‰','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,11,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('47b85390b9f14fd4ad4a1f25f0950c10','667b900e55b04031bd25301c0589bdf2','account_no','è™šæ‹Ÿè´¦æˆ·','varchar(20)','String','accountNo','0','1','1','1','0','0','=','input','',NULL,20,'1','2016-07-19 11:16:43','1','2016-07-19 11:16:43',NULL,'1'),('47dc7104d72f4327bd13618a51db97e2','341adfbbd1894a089be1196396428e20','nationality','å›½å®¶æˆ–åœ°åŒº','varchar(150)','String','nationality','0','1','1','1','0','0','=','input','',NULL,270,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('47ed31cd7b4045d7bb5f00670c778d3d','3d721d0d5c424b5fac3c1ab702cfaf77','currtype','å¸ç§','int(11)','String','currtype','0','1','1','1','0','0','=','input','',NULL,150,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('4a0a1fff86ca46519477d66b82e01991','aef6f1fc948f4c9ab1c1b780bc471cc2','name','åç§°','nvarchar2(100)','String','name','0','1','1','1','1','1','like','input',NULL,NULL,5,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('4a63b3a6f6834501b037ac06dc8b27b4','c3d9205399914896b72fea6cd962cd99','hukou','æˆ·å£','varchar(150)','String','hukou','0','1','1','1','0','0','=','input','',NULL,250,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('4b04bf2fbbfb402cafc4e395ce241695','341adfbbd1894a089be1196396428e20','fpnation','å…¬å¸ç”µè¯','char(5)','String','fpnation','0','1','1','1','0','0','=','input','',NULL,180,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('4b172bc9f8e941cb84fd6a49add5e74c','c3d9205399914896b72fea6cd962cd99','fpextension','å…¬å¸ç”µè¯-åˆ†æœº','char(10)','String','fpextension','0','1','1','1','0','0','=','input','',NULL,210,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('4b62db4cbbcb4b71a30e4582e8e75b0f','3d721d0d5c424b5fac3c1ab702cfaf77','address','åœ°å€','varchar(150)','String','address','0','1','1','1','0','0','=','input','',NULL,340,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('4c60271f6098493bb89ed1665640a609','229400ebd07249a6815a37ee0dce4710','gender','æ€§åˆ«','int(11)','String','gender','0','1','1','1','0','0','=','select','sex',NULL,30,'1','2016-07-21 17:20:40','1','2016-07-21 17:20:40',NULL,'1'),('4c8ef12cb6924b9ba44048ba9913150b','43d6d5acffa14c258340ce6765e46c6f','create_date','åˆ›å»ºæ—¶é—´','timestamp(6)','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect',NULL,NULL,9,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('4e5681527c594310b675886fe0edd6d2','3d721d0d5c424b5fac3c1ab702cfaf77','headimgurl','ä¸ªäººå¤´åƒ','varchar(200)','String','headimgurl','0','1','1','1','0','0','=','fileselect','',NULL,40,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('4f4b569f66f34063b51fb2203a3a91de','6a1f05b34c3a46a6b0ef42f09c4271c8','update_by','æ›´æ–°è€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','1','1','1','0','0','=','input','',NULL,170,'1','2016-07-18 19:41:42','1','2016-07-18 19:41:42',NULL,'0'),('528a7961767146d1af75178034fd66ef','c3d9205399914896b72fea6cd962cd99','home_page','ä¸ªäººä¸»é¡µ','varchar(200)','String','homePage','0','1','1','1','0','0','=','input','',NULL,330,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('52aa681a98b44468bc9eedad93132647','3d721d0d5c424b5fac3c1ab702cfaf77','location','å±…ä½åœ°','varchar(150)','String','location','0','1','1','1','0','0','=','input','',NULL,120,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('52abb526ab874692a117db16542800fb','c3d9205399914896b72fea6cd962cd99','address','åœ°å€','varchar(150)','String','address','0','1','1','1','0','0','=','input','',NULL,340,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('53d65a3d306d4fac9e561db9d3c66912','6e05c389f3c6415ea34e55e9dfb28934','del_flag','åˆ é™¤æ ‡è®°ï¼ˆ0ï¼šæ­£å¸¸ï¼›1ï¼šåˆ é™¤ï¼‰','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,9,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('5404f8c874b3481ca54baa878d6b7af2','229400ebd07249a6815a37ee0dce4710','headimgurl','ä¸ªäººå¤´åƒ','varchar(200)','String','headimgurl','0','1','1','1','0','0','=','fileselect','',NULL,40,'1','2016-07-21 17:20:40','1','2016-07-21 17:20:40',NULL,'1'),('550dcee0a5204207a5aa99b0ef8bbb8e','341adfbbd1894a089be1196396428e20','fpcity','å…¬å¸ç”µè¯-åŒºå·','char(5)','String','fpcity','0','1','1','1','0','0','=','input','',NULL,190,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('56fa71c0bd7e4132931874e548dc9ba5','6e05c389f3c6415ea34e55e9dfb28934','update_by','æ›´æ–°è€…','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input',NULL,NULL,6,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('58fb9809a496432eae7073f503e54068','3d721d0d5c424b5fac3c1ab702cfaf77','gender','æ€§åˆ«','int(11)','String','gender','0','1','1','1','0','0','=','select','sex',NULL,30,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('591dbb4cff6c4ad7b90ee1ac350554b0','341adfbbd1894a089be1196396428e20','mobile','æ‰‹æœºå·ç ','varchar(20)','String','mobile','0','1','1','1','0','0','=','input','',NULL,170,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('5a4a1933c9c844fdba99de043dc8205e','aef6f1fc948f4c9ab1c1b780bc471cc2','update_by','æ›´æ–°è€…','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input',NULL,NULL,10,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('5a71db76850c4a7484a84c46cb6fd867','3d721d0d5c424b5fac3c1ab702cfaf77','ali_talk','æ—ºæ—ºid','varchar(100)','String','aliTalk','0','1','1','1','0','0','=','input','',NULL,320,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('5b22e5563b4143ed941cba72f9725207','c3d9205399914896b72fea6cd962cd99','nationality','å›½å®¶æˆ–åœ°åŒº','varchar(150)','String','nationality','0','1','1','1','0','0','=','input','',NULL,270,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('5e5c69bd3eaa4dcc9743f361f3771c08','aef6f1fc948f4c9ab1c1b780bc471cc2','id','ç¼–å·','varchar2(64)','String','id','1','0','1','0','0','0','=','input',NULL,NULL,1,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('5e87fe9d334442c6ad58db2541570edc','341adfbbd1894a089be1196396428e20','student_group','å·¥ä½œç»éªŒ','int(11)','String','studentGroup','0','1','1','1','0','0','=','input','',NULL,350,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('60fd7bdc5e8d45ad869e295db210f213','dbd4126e43eb4978b1e3099e920b4416','date','æ—¥æœŸ','varchar(64)','String','date','0','0','1','1','0','0','=','input','',NULL,20,'1','2016-08-01 17:50:52','1','2016-08-01 17:56:14',NULL,'0'),('6179947b21e14a0b92e5e9cc6f14393e','c3d9205399914896b72fea6cd962cd99','mobile','æ‰‹æœºå·ç ','varchar(20)','String','mobile','0','1','1','1','0','0','=','input','',NULL,170,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('61f3637d9fff4a0099fe12fda1090169','6a1f05b34c3a46a6b0ef42f09c4271c8','language','ç”¨æˆ·çš„è¯­è¨€ï¼Œç®€ä½“ä¸­æ–‡ä¸ºzh_CN','varchar(200)','String','language','0','1','1','1','0','0','=','input','',NULL,90,'1','2016-07-18 19:41:42','1','2016-07-18 19:41:42',NULL,'0'),('633f5a49ec974c099158e7b3e6bfa930','f6e4dafaa72f4c509636484715f33a96','name','åç§°','nvarchar2(100)','String','name','0','0','1','1','1','1','like','input',NULL,NULL,4,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('63efe2d6c7af4f57b9cf92a4ab97527d','341adfbbd1894a089be1196396428e20','year_of_birthday','å‡ºç”Ÿæ—¥æœŸ-å¹´','char(4)','String','yearOfBirthday','0','1','1','1','0','0','=','input','',NULL,60,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('64b995d9df1e436f96db25868c88d79f','341adfbbd1894a089be1196396428e20','gender','æ€§åˆ«','int(11)','String','gender','0','1','1','1','0','0','=','select','sex',NULL,30,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('651c0a5c60c84d08a6d6e2a356ee435c','4146c299178d44dfb125f9637179fd9c','salt','salt','char(6)','String','salt','0','0','1','1','0','0','=','input','',NULL,130,'1','2016-07-19 11:00:49','1','2016-07-19 11:00:49',NULL,'1'),('652491500f2641ffa7caf95a93e64d34','6e05c389f3c6415ea34e55e9dfb28934','update_date','æ›´æ–°æ—¶é—´','timestamp(6)','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect',NULL,NULL,7,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('655ee38bea314c2d8926dfc5928d72ed','3d721d0d5c424b5fac3c1ab702cfaf77','hpnumber','å®¶åº­ç”µè¯-ç”µè¯å·ç ','char(20)','String','hpnumber','0','1','1','1','0','0','=','input','',NULL,240,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('662bc28f52574cb0a5ade90385020c9f','dbd4126e43eb4978b1e3099e920b4416','create_date','åˆ›å»ºæ—¶é—´','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,70,'1','2016-08-01 17:50:52','1','2016-08-01 17:56:14',NULL,'0'),('6763ff6dc7cd4c668e76cf9b697d3ff6','f6e4dafaa72f4c509636484715f33a96','sort','æ’åº','number(10)','Integer','sort','0','0','1','1','1','0','=','input',NULL,NULL,5,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('67a9675c14894c52a74c88f287f0b2ff','229400ebd07249a6815a37ee0dce4710','work_year','å·¥ä½œå¹´é™','int(11)','String','workYear','0','1','1','1','0','0','=','input','',NULL,60,'1','2016-07-21 17:20:40','1','2016-07-21 17:20:40',NULL,'1'),('67d0331f809a48ee825602659f0778e8','43d6d5acffa14c258340ce6765e46c6f','name','åç§°','nvarchar2(100)','String','name','0','1','1','1','1','1','like','input',NULL,NULL,5,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('67eee55d5bc34062aef7af3626d5bcab','341adfbbd1894a089be1196396428e20','current_situation','æ±‚èŒçŠ¶æ€','int(11)','String','currentSituation','0','1','1','1','0','0','=','input','',NULL,160,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('68345713bef3445c906f70e68f55de38','6e05c389f3c6415ea34e55e9dfb28934','test_data_main_id','ä¸šåŠ¡ä¸»è¡¨','varchar2(64)','String','testDataMain.id','0','1','1','1','0','0','=','input',NULL,NULL,2,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('69ed98d1e1984fd292fb85af33779d14','3d721d0d5c424b5fac3c1ab702cfaf77','mobile','æ‰‹æœºå·ç ','varchar(20)','String','mobile','0','1','1','1','0','0','=','input','',NULL,170,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('6b15d763c78e44b8984df629b6abac3d','4146c299178d44dfb125f9637179fd9c','password','password','char(32)','String','password','0','0','1','1','0','0','=','input','',NULL,30,'1','2016-07-19 11:00:49','1','2016-07-19 11:00:49',NULL,'1'),('6bafd32de7404ccf84029ec15e36a5d3','6a1f05b34c3a46a6b0ef42f09c4271c8','subscribe_time','ç”¨æˆ·å…³æ³¨æ—¶é—´ï¼Œä¸ºæ—¶é—´æˆ³ã€‚å¦‚æœç”¨æˆ·æ›¾å¤šæ¬¡å…³æ³¨ï¼Œåˆ™å–æœ€åå…³æ³¨æ—¶é—´','varchar(200)','String','subscribeTime','0','1','1','1','0','0','=','input','',NULL,110,'1','2016-07-18 19:41:42','1','2016-07-18 19:41:42',NULL,'0'),('6bf45384046548cb9d108d4670c2ec97','3d721d0d5c424b5fac3c1ab702cfaf77','zip_code','é‚®ç¼–','char(6)','String','zipCode','0','1','1','1','0','0','=','input','',NULL,310,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('6f7cb5ea05a643e3b0288e98e941dcfe','dbd4126e43eb4978b1e3099e920b4416','id','ç”¨æˆ·çš„æ ‡è¯†ï¼Œå¯¹å½“å‰å…¬ä¼—å·å”¯ä¸€','varchar(200)','String','id','1','0','1','0','0','0','=','input','',NULL,10,'1','2016-08-01 17:50:52','1','2016-08-01 17:56:14',NULL,'0'),('6fa3a2a649b34142a70e12accbe8ecfe','dbd4126e43eb4978b1e3099e920b4416','update_date','æ›´æ–°æ—¶é—´','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,90,'1','2016-08-01 17:50:52','1','2016-08-01 17:56:14',NULL,'0'),('701ad20f50754155b220af09c625fe36','341adfbbd1894a089be1196396428e20','day_of_birthday','å‡ºç”Ÿæ—¥æœŸ-æ—¥','char(2)','String','dayOfBirthday','0','1','1','1','0','0','=','input','',NULL,80,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('71ea4bc10d274911b405f3165fc1bb1a','aef6f1fc948f4c9ab1c1b780bc471cc2','area_id','å½’å±åŒºåŸŸ','nvarchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.Area','area.id|name','0','1','1','1','1','1','=','areaselect',NULL,NULL,4,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('71fe19b8d78549629408ac55041fb5f7','341adfbbd1894a089be1196396428e20','month_of_birthday','å‡ºç”Ÿæ—¥æœŸ-æœˆ','char(2)','String','monthOfBirthday','0','1','1','1','0','0','=','input','',NULL,70,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('74bae0010352466fafecc07c276289e8','6a1f05b34c3a46a6b0ef42f09c4271c8','create_by','åˆ›å»ºè€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','1','1','0','0','0','=','input','',NULL,150,'1','2016-07-18 19:41:42','1','2016-07-18 19:41:42',NULL,'0'),('77746b51c1e840d59f196f1a21c8aa37','dbd4126e43eb4978b1e3099e920b4416','update_by','æ›´æ–°è€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,80,'1','2016-08-01 17:50:52','1','2016-08-01 17:56:14',NULL,'0'),('77b54ea3d3ad4e84860cbe068029f003','341adfbbd1894a089be1196396428e20','email','email','varchar(80)','String','email','0','1','1','1','0','0','=','input','',NULL,130,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('78efce808c20460883daf08d57001d64','6a1f05b34c3a46a6b0ef42f09c4271c8','nickname','ç”¨æˆ·çš„æ˜µç§°','varchar(200)','String','nickname','0','1','1','1','0','0','=','input','',NULL,40,'1','2016-07-18 19:41:42','1','2016-07-18 19:41:42',NULL,'0'),('7a7d6166ad3149e59325da8c908f2539','3d721d0d5c424b5fac3c1ab702cfaf77','marrige','å©šå§»çŠ¶å†µ','int(11)','String','marrige','0','1','1','1','0','0','=','input','',NULL,290,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('7bdd63b5e8984753b39cbc31c28fe986','c3d9205399914896b72fea6cd962cd99','zip_code','é‚®ç¼–','char(6)','String','zipCode','0','1','1','1','0','0','=','input','',NULL,310,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('7cde129cf67e4740a8be58f31c8c73c7','4146c299178d44dfb125f9637179fd9c','myid','myid','char(30)','String','myid','0','0','1','1','0','0','=','input','',NULL,70,'1','2016-07-19 11:00:49','1','2016-07-19 11:00:49',NULL,'1'),('7e11d337d8af431bb12c3122c6e65b49','341adfbbd1894a089be1196396428e20','home_page','ä¸ªäººä¸»é¡µ','varchar(200)','String','homePage','0','1','1','1','0','0','=','input','',NULL,330,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('7e62e8014d494365976140517c067b22','3d721d0d5c424b5fac3c1ab702cfaf77','day_of_birthday','å‡ºç”Ÿæ—¥æœŸ-æ—¥','char(2)','String','dayOfBirthday','0','1','1','1','0','0','=','input','',NULL,80,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('7ea06ea8642e4f5abb60aee36b30d7d2','667b900e55b04031bd25301c0589bdf2','status','çŠ¶æ€','char(1)','String','status','0','0','1','1','0','0','=','input','',NULL,100,'1','2016-07-19 11:16:43','1','2016-07-19 11:16:43',NULL,'1'),('7f72b93a1b984b21b592ba417946c057','c3d9205399914896b72fea6cd962cd99','currtype','å¸ç§','int(11)','String','currtype','0','1','1','1','0','0','=','input','',NULL,150,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('7f871058d94c4d9a89084be7c9ce806d','6e05c389f3c6415ea34e55e9dfb28934','remarks','å¤‡æ³¨ä¿¡æ¯','nvarchar2(255)','String','remarks','0','1','1','1','1','0','=','input',NULL,NULL,8,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('804ac4d5b7e84628b5086066ea8b70f5','1e4e3d1a4a61423a86949011843ec4ed','id','ç”¨æˆ·çš„æ ‡è¯†ï¼Œå¯¹å½“å‰å…¬ä¼—å·å”¯ä¸€','varchar(200)','String','id','1','0','1','0','0','0','=','input','',NULL,10,'1','2016-07-19 11:04:55','1','2016-07-19 11:04:55',NULL,'1'),('828e015e77fd4d4bae643a52e793f9d0','341adfbbd1894a089be1196396428e20','hukou','æˆ·å£','varchar(150)','String','hukou','0','1','1','1','0','0','=','input','',NULL,250,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('8314ed81f4eb445999f52ba026b59380','6a1f05b34c3a46a6b0ef42f09c4271c8','unionid','åªæœ‰åœ¨ç”¨æˆ·å°†å…¬ä¼—å·ç»‘å®šåˆ°å¾®ä¿¡å¼€æ”¾å¹³å°å¸å·åï¼Œæ‰ä¼šå‡ºç°è¯¥å­—æ®µã€‚','varchar(200)','String','unionid','0','1','1','1','0','0','=','input','',NULL,120,'1','2016-07-18 19:41:42','1','2016-07-18 19:41:42',NULL,'0'),('84fec0ccbf804e17b654e6ba124a8a1c','6a1f05b34c3a46a6b0ef42f09c4271c8','openid','ç”¨æˆ·çš„æ ‡è¯†ï¼Œå¯¹å½“å‰å…¬ä¼—å·å”¯ä¸€','varchar(200)','String','openid','0','0','1','1','0','0','=','input','',NULL,30,'1','2016-07-18 19:41:42','1','2016-07-18 19:41:42',NULL,'0'),('8a43414fcc904680a1dc2868da469d43','c3d9205399914896b72fea6cd962cd99','idnumber','è¯ä»¶å·','varchar(25)','String','idnumber','0','1','1','1','0','0','=','input','',NULL,110,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('8b48774cfe184913b8b5eb17639cf12d','43d6d5acffa14c258340ce6765e46c6f','create_by','åˆ›å»ºè€…','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input',NULL,NULL,8,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('8b7cf0525519474ebe1de9e587eb7067','6e05c389f3c6415ea34e55e9dfb28934','create_date','åˆ›å»ºæ—¶é—´','timestamp(6)','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect',NULL,NULL,5,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('8b9de88df53e485d8ef461c4b1824bc1','43d6d5acffa14c258340ce6765e46c6f','user_id','å½’å±ç”¨æˆ·','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','user.id|name','0','1','1','1','1','1','=','userselect',NULL,NULL,2,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('8bc38271c3f3400298006bc6d404d9ed','3d721d0d5c424b5fac3c1ab702cfaf77','student_group','å·¥ä½œç»éªŒ','int(11)','String','studentGroup','0','1','1','1','0','0','=','input','',NULL,350,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('8c00ed333d43489ca047602edd48cbb4','1e4e3d1a4a61423a86949011843ec4ed','remarks','å¤‡æ³¨ä¿¡æ¯','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,80,'1','2016-07-19 11:04:55','1','2016-07-19 11:04:55',NULL,'1'),('8c26006f177044b39e234e05462c8358','1c68860c5701474788d4627b05281a24','location_y','location_y','varchar(200)','String','locationY','0','1','1','1','0','0','=','input','',NULL,70,'1','2016-07-18 20:40:48','1','2016-07-18 20:40:48',NULL,'0'),('8da38dbe5fe54e9bb1f9682c27fbf403','aef6f1fc948f4c9ab1c1b780bc471cc2','remarks','å¤‡æ³¨ä¿¡æ¯','nvarchar2(255)','String','remarks','0','1','1','1','1','0','=','textarea',NULL,NULL,12,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('8dd9a6e0a9134a759a911684f5545edf','341adfbbd1894a089be1196396428e20','qq_talk','qqå·','varchar(20)','String','qqTalk','0','1','1','1','0','0','=','input','',NULL,300,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('8e1c990f2bd44e2687783f45c84870ec','c3d9205399914896b72fea6cd962cd99','id','ç”¨æˆ·çš„æ ‡è¯†ï¼Œå¯¹å½“å‰å…¬ä¼—å·å”¯ä¸€','varchar(200)','String','id','1','0','1','0','0','0','=','input','',NULL,10,'1','2016-07-21 16:25:47','1','2016-07-21 16:25:47',NULL,'1'),('8e5093a3d98a47ba974b1cd540db687b','1c68860c5701474788d4627b05281a24','longitude','åœ°ç†ä½ç½®ç»åº¦','varchar(200)','String','longitude','0','1','1','1','0','0','=','input','',NULL,50,'1','2016-07-18 20:40:48','1','2016-07-18 20:40:48',NULL,'0'),('8edb2dece4ce472785bce48c1f96033a','229400ebd07249a6815a37ee0dce4710','stature','èº«é«˜','int(11)','String','stature','0','1','1','1','0','0','=','input','',NULL,160,'1','2016-07-21 17:20:40','1','2016-07-21 17:20:40',NULL,'1'),('9057428f63ff46ca8d68fd5e402f1ad6','229400ebd07249a6815a37ee0dce4710','location','å±…ä½åœ°','varchar(150)','String','location','0','1','1','1','0','0','=','input','',NULL,90,'1','2016-07-21 17:20:40','1','2016-07-21 17:20:40',NULL,'1'),('92481c16a0b94b0e8bba16c3c54eb1e4','f6e4dafaa72f4c509636484715f33a96','create_date','åˆ›å»ºæ—¶é—´','timestamp(6)','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect',NULL,NULL,7,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('9272caf899e54a9fa1cc57e2e735d677','c3d9205399914896b72fea6cd962cd99','hpnumber','å®¶åº­ç”µè¯-ç”µè¯å·ç ','char(20)','String','hpnumber','0','1','1','1','0','0','=','input','',NULL,240,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('92d157087bb54d8b8d1f08c3178bde3c','341adfbbd1894a089be1196396428e20','ali_talk','æ—ºæ—ºid','varchar(100)','String','aliTalk','0','1','1','1','0','0','=','input','',NULL,320,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('9568a35897a84c30ac675ed2dfa282d6','341adfbbd1894a089be1196396428e20','fpextension','å…¬å¸ç”µè¯-åˆ†æœº','char(10)','String','fpextension','0','1','1','1','0','0','=','input','',NULL,210,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('9610b063ba354b7796d99b2cb2d433c8','341adfbbd1894a089be1196396428e20','id','ç”¨æˆ·çš„æ ‡è¯†ï¼Œå¯¹å½“å‰å…¬ä¼—å·å”¯ä¸€','varchar(200)','String','id','1','0','1','0','0','0','=','input','',NULL,10,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('9672f7ad1b2b48469de771c24fb78f64','341adfbbd1894a089be1196396428e20','location','å±…ä½åœ°','varchar(150)','String','location','0','1','1','1','0','0','=','input','',NULL,120,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('96850390fd4f4e188471c1898d606984','c3d9205399914896b72fea6cd962cd99','fpnation','å…¬å¸ç”µè¯','char(5)','String','fpnation','0','1','1','1','0','0','=','input','',NULL,180,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('9686f6adc75c4d7088390641d2137877','229400ebd07249a6815a37ee0dce4710','idnumber','è¯ä»¶å·','varchar(25)','String','idnumber','0','0','1','1','0','0','=','input','',NULL,80,'1','2016-07-21 17:20:40','1','2016-07-21 17:20:40',NULL,'1'),('99b96468100a4f42aee1de356047fffe','229400ebd07249a6815a37ee0dce4710','home_page','ä¸ªäººä¸»é¡µ','varchar(200)','String','homePage','0','1','1','1','0','0','=','input','',NULL,210,'1','2016-07-21 17:20:40','1','2016-07-21 17:20:40',NULL,'1'),('9a012c1d2f934dbf996679adb7cc827a','f6e4dafaa72f4c509636484715f33a96','parent_id','çˆ¶çº§ç¼–å·','varchar2(64)','This','parent.id|name','0','0','1','1','0','0','=','treeselect',NULL,NULL,2,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('9cf51e3d13004d9bb13950b378426b44','c3d9205399914896b72fea6cd962cd99','hpnation','å®¶åº­ç”µè¯','char(5)','String','hpnation','0','1','1','1','0','0','=','input','',NULL,220,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('9dec681be6c94acebffe56c7c90bebb1','6a1f05b34c3a46a6b0ef42f09c4271c8','province','ç”¨æˆ·æ‰€åœ¨çœä»½','varchar(200)','String','province','0','1','1','1','0','0','=','input','',NULL,80,'1','2016-07-18 19:41:42','1','2016-07-18 19:41:42',NULL,'0'),('9fd6a3ce545e4480a3790c20cf66f15c','3d721d0d5c424b5fac3c1ab702cfaf77','resumekey','å…³é”®å­—','char(12)','String','resumekey','0','1','1','1','0','0','=','input','',NULL,260,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('a0b907c7821a4154b1134b95f0bf7892','667b900e55b04031bd25301c0589bdf2','create_by','åˆ›å»ºè€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','1','1','0','0','0','=','input','',NULL,50,'1','2016-07-19 11:16:43','1','2016-07-19 11:16:43',NULL,'1'),('a2084550825149a5986edc7a1068170f','3d721d0d5c424b5fac3c1ab702cfaf77','email','email','varchar(80)','String','email','0','1','1','1','0','0','=','input','',NULL,130,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('a2dc5b0571144ced9b56b45ce874aa68','c3d9205399914896b72fea6cd962cd99','gender','æ€§åˆ«','int(11)','String','gender','0','1','1','1','0','0','=','select','sex',NULL,30,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('a347f78cc57741cfbee5c718c7507914','3d721d0d5c424b5fac3c1ab702cfaf77','hpcity','å®¶åº­ç”µè¯-åŒºå·','char(5)','String','hpcity','0','1','1','1','0','0','=','input','',NULL,230,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('a38a7f8db84547f890e817c6aa5fc0e9','3d721d0d5c424b5fac3c1ab702cfaf77','qq_talk','qqå·','varchar(20)','String','qqTalk','0','1','1','1','0','0','=','input','',NULL,300,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('a3959a2753fe418790c0d551c09c3255','6a1f05b34c3a46a6b0ef42f09c4271c8','subscribe','ç”¨æˆ·æ˜¯å¦è®¢é˜…è¯¥å…¬ä¼—å·æ ‡è¯†ï¼Œå€¼ä¸º0æ—¶ï¼Œä»£è¡¨æ­¤ç”¨æˆ·æ²¡æœ‰å…³æ³¨è¯¥å…¬ä¼—å·ï¼Œæ‹‰å–ä¸åˆ°å…¶ä½™ä¿¡æ¯ã€‚','varchar(200)','String','subscribe','0','1','1','1','0','0','=','input','',NULL,20,'1','2016-07-18 19:41:42','1','2016-07-18 19:41:42',NULL,'0'),('a5e11950c62d46919cbec9441603329a','6a1f05b34c3a46a6b0ef42f09c4271c8','country','ç”¨æˆ·æ‰€åœ¨å›½å®¶','varchar(200)','String','country','0','1','1','1','0','0','=','input','',NULL,70,'1','2016-07-18 19:41:42','1','2016-07-18 19:41:42',NULL,'0'),('a920368b26e241f9a0caa986a44a35dd','6a1f05b34c3a46a6b0ef42f09c4271c8','remark','å…¬ä¼—å·è¿è¥è€…å¯¹ç²‰ä¸çš„å¤‡æ³¨ï¼Œå…¬ä¼—å·è¿è¥è€…å¯åœ¨å¾®ä¿¡å…¬ä¼—å¹³å°ç”¨æˆ·ç®¡ç†ç•Œé¢å¯¹ç²‰ä¸æ·»åŠ å¤‡æ³¨','varchar(200)','String','remark','0','1','1','1','0','0','=','input','',NULL,130,'1','2016-07-18 19:41:42','1','2016-07-18 19:41:42',NULL,'0'),('aa3bcf9ac2d64ddb8f5ee06545710a33','229400ebd07249a6815a37ee0dce4710','qq_talk','qqå·','varchar(20)','String','qqTalk','0','1','1','1','0','0','=','input','',NULL,180,'1','2016-07-21 17:20:40','1','2016-07-21 17:20:40',NULL,'1'),('acca8c6581fc4ffbbb598e22d72670fa','c3d9205399914896b72fea6cd962cd99','card_type','è¯ä»¶ç±»å‹','int(11)','String','cardType','0','1','1','1','0','0','=','input','',NULL,100,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('ad3bf0d4b44b4528a5211a66af88f322','aef6f1fc948f4c9ab1c1b780bc471cc2','office_id','å½’å±éƒ¨é—¨','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.Office','office.id|name','0','1','1','1','1','1','=','officeselect',NULL,NULL,3,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('b0275300e9b7478798e50609b7c2e552','6a1f05b34c3a46a6b0ef42f09c4271c8','id','ç¼–å·','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,10,'1','2016-07-18 19:41:42','1','2016-07-18 19:41:42',NULL,'0'),('b136e37daf7f4819ac360b1e3f296157','3d721d0d5c424b5fac3c1ab702cfaf77','nationality','å›½å®¶æˆ–åœ°åŒº','varchar(150)','String','nationality','0','1','1','1','0','0','=','input','',NULL,270,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('b151afe196f24341b51daeca563e0318','4146c299178d44dfb125f9637179fd9c','myidkey','myidkey','char(16)','String','myidkey','0','0','1','1','0','0','=','input','',NULL,80,'1','2016-07-19 11:00:49','1','2016-07-19 11:00:49',NULL,'1'),('b3f2f4b9632c4372841efd65a2446e4d','dbd4126e43eb4978b1e3099e920b4416','clock_in','ä¸Šç­æ‰“å¡','varchar(64)','String','clockIn','0','1','1','1','0','0','=','input','',NULL,40,'1','2016-08-01 17:50:52','1','2016-08-01 17:56:14',NULL,'0'),('b6135d22a4cd4ac38a080b2048e2d291','667b900e55b04031bd25301c0589bdf2','update_by','æ›´æ–°è€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','1','1','1','0','0','=','input','',NULL,70,'1','2016-07-19 11:16:43','1','2016-07-19 11:16:43',NULL,'1'),('b6effdb87f234347bface2d29c7c6d28','4146c299178d44dfb125f9637179fd9c','secques','secques','char(8)','String','secques','0','0','1','1','0','0','=','input','',NULL,140,'1','2016-07-19 11:00:49','1','2016-07-19 11:00:49',NULL,'1'),('b7b8f9ebeab04995bbeb6096fbe8ac33','341adfbbd1894a089be1196396428e20','birthday','å‡ºç”Ÿæ—¥æœŸ','varchar(12)','String','birthday','0','1','1','1','0','0','=','dateselect','',NULL,50,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('b8a531a439fc4487a4af5d961a139a66','6a1f05b34c3a46a6b0ef42f09c4271c8','update_date','æ›´æ–°æ—¶é—´','datetime','java.util.Date','updateDate','0','1','1','1','1','0','=','dateselect','',NULL,180,'1','2016-07-18 19:41:42','1','2016-07-18 19:41:42',NULL,'0'),('b8ee0e6c276a452b972c943fd19e3b8a','341adfbbd1894a089be1196396428e20','status','çŠ¶æ€','char(1)','String','status','0','0','1','1','0','0','=','input','',NULL,360,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('b947f7a423ec4b8fac85e343d92c853a','c3d9205399914896b72fea6cd962cd99','resumekey','å…³é”®å­—','char(12)','String','resumekey','0','1','1','1','0','0','=','input','',NULL,260,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('b9e1ff1eb29b464c959644ac72660872','1c68860c5701474788d4627b05281a24','latitude','åœ°ç†ä½ç½®çº¬åº¦','varchar(200)','String','latitude','0','1','1','1','0','0','=','input','',NULL,40,'1','2016-07-18 20:40:48','1','2016-07-18 20:40:48',NULL,'0'),('b9e77f1d34aa46fab6b47d9b0734ea08','341adfbbd1894a089be1196396428e20','stature','èº«é«˜','int(11)','String','stature','0','1','1','1','0','0','=','input','',NULL,280,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('ba4fe609fb2b4ef3a21d5777dafee4d6','4146c299178d44dfb125f9637179fd9c','lastlogintime','lastlogintime','int(10) unsigned','String','lastlogintime','0','0','1','1','0','0','=','input','',NULL,120,'1','2016-07-19 11:00:49','1','2016-07-19 11:00:49',NULL,'1'),('baec899f2a2140a299a3150e7bcc9748','3d721d0d5c424b5fac3c1ab702cfaf77','fpnation','å…¬å¸ç”µè¯','char(5)','String','fpnation','0','1','1','1','0','0','=','input','',NULL,180,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('bb1256a8d1b741f6936d8fed06f45eed','f6e4dafaa72f4c509636484715f33a96','update_by','æ›´æ–°è€…','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input',NULL,NULL,8,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('bcf5b519d3994b718671d5831768754b','229400ebd07249a6815a37ee0dce4710','status','çŠ¶æ€','char(1)','String','status','0','0','1','1','0','0','=','select','yes_no',NULL,240,'1','2016-07-21 17:20:40','1','2016-07-21 17:20:40',NULL,'1'),('bd967d5ec26743bda13f7355c8246270','341adfbbd1894a089be1196396428e20','work_year','å·¥ä½œå¹´é™','int(11)','String','workYear','0','1','1','1','0','0','=','input','',NULL,90,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('bdc0e5f22cb345d48eef2a8b15e66c5f','3d721d0d5c424b5fac3c1ab702cfaf77','birthday','å‡ºç”Ÿæ—¥æœŸ','varchar(12)','String','birthday','0','1','1','1','0','0','=','dateselect','',NULL,50,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('be2de49345314fc58dbafb74458c247b','3d721d0d5c424b5fac3c1ab702cfaf77','idnumber','è¯ä»¶å·','varchar(25)','String','idnumber','0','1','1','1','0','0','=','input','',NULL,110,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('bf1e31640e7b4c41b0226fdebed311f2','dbd4126e43eb4978b1e3099e920b4416','remarks','å¤‡æ³¨ä¿¡æ¯','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,100,'1','2016-08-01 17:50:52','1','2016-08-01 17:56:14',NULL,'0'),('c059c955cf3e4d019f7dc5bcb3c2251f','3d721d0d5c424b5fac3c1ab702cfaf77','hukou','æˆ·å£','varchar(150)','String','hukou','0','1','1','1','0','0','=','input','',NULL,250,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('c15af57fbc1e46d98011e139da7e2a3c','1e4e3d1a4a61423a86949011843ec4ed','create_by','åˆ›å»ºè€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','1','1','0','0','0','=','input','',NULL,40,'1','2016-07-19 11:04:55','1','2016-07-19 11:04:55',NULL,'1'),('c280c4a2c4f84dcc9d6d017386d10410','6a1f05b34c3a46a6b0ef42f09c4271c8','create_date','åˆ›å»ºæ—¶é—´','datetime','java.util.Date','createDate','0','1','1','0','0','0','=','dateselect','',NULL,160,'1','2016-07-18 19:41:42','1','2016-07-18 19:41:42',NULL,'0'),('c4393ff3fd4d4640b867bb34fc25e7a1','1c68860c5701474788d4627b05281a24','location_x','location_x','varchar(200)','String','locationX','0','1','1','1','0','0','=','input','',NULL,60,'1','2016-07-18 20:40:48','1','2016-07-18 20:40:48',NULL,'0'),('c58f95b11c98450b86816e7783e2b6d2','1e4e3d1a4a61423a86949011843ec4ed','create_date','åˆ›å»ºæ—¶é—´','datetime','java.util.Date','createDate','0','1','1','0','0','0','=','dateselect','',NULL,50,'1','2016-07-19 11:04:55','1','2016-07-19 11:04:55',NULL,'1'),('c62de2d469a04817855dd3791ae07f09','341adfbbd1894a089be1196396428e20','name','å§“å','varchar(20)','String','name','0','1','1','1','1','1','like','input','',NULL,20,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('c6bb63724b834ba69c0f50e3e6e145d0','3d721d0d5c424b5fac3c1ab702cfaf77','year_of_birthday','å‡ºç”Ÿæ—¥æœŸ-å¹´','char(4)','String','yearOfBirthday','0','1','1','1','0','0','=','input','',NULL,60,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('c6c815d39a624f0c9491cd71beb74010','229400ebd07249a6815a37ee0dce4710','resumekey','å…³é”®å­—','char(12)','String','resumekey','0','1','1','1','0','0','=','input','',NULL,150,'1','2016-07-21 17:20:40','1','2016-07-21 17:20:40',NULL,'1'),('c6c9626504174d52b7b0b96865a0d7e4','341adfbbd1894a089be1196396428e20','resumekey','å…³é”®å­—','char(12)','String','resumekey','0','1','1','1','0','0','=','input','',NULL,260,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('c6d584b5fbad4413ad78978bc0b8be6a','c3d9205399914896b72fea6cd962cd99','birthday','å‡ºç”Ÿæ—¥æœŸ','varchar(12)','String','birthday','0','1','1','1','0','0','=','dateselect','',NULL,50,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('c6da1c6e9a664f48a3058d8f90ca8b43','229400ebd07249a6815a37ee0dce4710','student_group','å·¥ä½œç»éªŒ','int(11)','String','studentGroup','0','1','1','1','0','0','=','input','',NULL,230,'1','2016-07-21 17:20:40','1','2016-07-21 17:20:40',NULL,'1'),('c75208cbc4a942bdac506289e7ee5110','4146c299178d44dfb125f9637179fd9c','truename','truename','char(15)','String','truename','0','0','1','1','0','0','=','input','',NULL,50,'1','2016-07-19 11:00:49','1','2016-07-19 11:00:49',NULL,'1'),('c9b865d1b9e54e15b22bf579c6c28a5b','6a1f05b34c3a46a6b0ef42f09c4271c8','city','ç”¨æˆ·æ‰€åœ¨åŸå¸‚','varchar(200)','String','city','0','1','1','1','0','0','=','input','',NULL,60,'1','2016-07-18 19:41:42','1','2016-07-18 19:41:42',NULL,'0'),('ca42c157c16249dc82c08ee94d375d9e','341adfbbd1894a089be1196396428e20','currtype','å¸ç§','int(11)','String','currtype','0','1','1','1','0','0','=','input','',NULL,150,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('ca68a2d403f0449cbaa1d54198c6f350','43d6d5acffa14c258340ce6765e46c6f','office_id','å½’å±éƒ¨é—¨','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.Office','office.id|name','0','1','1','1','0','0','=','officeselect',NULL,NULL,3,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('cb6fc67c0fca42f9a87a56dee0099a60','667b900e55b04031bd25301c0589bdf2','id','ç”¨æˆ·çš„æ ‡è¯†ï¼Œå¯¹å½“å‰å…¬ä¼—å·å”¯ä¸€','varchar(200)','String','id','1','0','1','0','0','0','=','input','',NULL,10,'1','2016-07-19 11:16:43','1','2016-07-19 11:16:43',NULL,'1'),('cb9c0ec3da26432d9cbac05ede0fd1d0','43d6d5acffa14c258340ce6765e46c6f','remarks','å¤‡æ³¨ä¿¡æ¯','nvarchar2(255)','String','remarks','0','1','1','1','1','0','=','textarea',NULL,NULL,12,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('ccc8dde0f94f4291bb0207ca07d9be84','667b900e55b04031bd25301c0589bdf2','remarks','å¤‡æ³¨ä¿¡æ¯','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,90,'1','2016-07-19 11:16:43','1','2016-07-19 11:16:43',NULL,'1'),('cdeec6e5d71d4944a96985a53bc1cb4c','c3d9205399914896b72fea6cd962cd99','fpnumber','å…¬å¸ç”µè¯-æ€»æœºå·ç ','char(20)','String','fpnumber','0','1','1','1','0','0','=','input','',NULL,200,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('ceaea425163c42349fa4e8908f8d384d','4146c299178d44dfb125f9637179fd9c','phone','phone','char(15)','String','phone','0','0','1','1','0','0','=','input','',NULL,40,'1','2016-07-19 11:00:49','1','2016-07-19 11:00:49',NULL,'1'),('cf143ce0f53c4d7bba6dfb7c6099b6cc','229400ebd07249a6815a37ee0dce4710','hukou','æˆ·å£','varchar(150)','String','hukou','0','1','1','1','0','0','=','input','',NULL,140,'1','2016-07-21 17:20:40','1','2016-07-21 17:20:40',NULL,'1'),('cfcfa06ea61749c9b4c4dbc507e0e580','f6e4dafaa72f4c509636484715f33a96','id','ç¼–å·','varchar2(64)','String','id','1','0','1','0','0','0','=','input',NULL,NULL,1,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('cff42372e14a4ab189e01065005c946b','341adfbbd1894a089be1196396428e20','hpnation','å®¶åº­ç”µè¯','char(5)','String','hpnation','0','1','1','1','0','0','=','input','',NULL,220,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('d0c820a84c444c8daf8278e8127594a2','3d721d0d5c424b5fac3c1ab702cfaf77','fpnumber','å…¬å¸ç”µè¯-æ€»æœºå·ç ','char(20)','String','fpnumber','0','1','1','1','0','0','=','input','',NULL,200,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('d35fbac0487e411f9452d20692d35d0c','1c68860c5701474788d4627b05281a24','create_by','åˆ›å»ºè€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','1','1','0','0','0','=','input','',NULL,80,'1','2016-07-18 20:40:48','1','2016-07-18 20:40:48',NULL,'0'),('d3b92e901c9840539dd25454fdc82239','229400ebd07249a6815a37ee0dce4710','address','åœ°å€','varchar(150)','String','address','0','1','1','1','0','0','=','input','',NULL,220,'1','2016-07-21 17:20:40','1','2016-07-21 17:20:40',NULL,'1'),('d461cd8d31ff447191d9cf1054b90a9e','667b900e55b04031bd25301c0589bdf2','truename','çœŸå®å§“å','varchar(200)','String','truename','0','1','1','1','0','0','=','input','',NULL,40,'1','2016-07-19 11:16:43','1','2016-07-19 11:16:43',NULL,'1'),('d5c2d932ae904aa8a9f9ef34cd36fb0b','43d6d5acffa14c258340ce6765e46c6f','sex','æ€§åˆ«','char(1)','String','sex','0','1','1','1','0','1','=','select','sex',NULL,6,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('d64185f95ab44687a052863c36c7e832','c3d9205399914896b72fea6cd962cd99','hpcity','å®¶åº­ç”µè¯-åŒºå·','char(5)','String','hpcity','0','1','1','1','0','0','=','input','',NULL,230,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('dfaec55ccdff4efeb9b855348da15a00','229400ebd07249a6815a37ee0dce4710','marrige','å©šå§»çŠ¶å†µ','int(11)','String','marrige','0','1','1','1','0','0','=','input','',NULL,170,'1','2016-07-21 17:20:40','1','2016-07-21 17:20:40',NULL,'1'),('e3b6d072b58e47fd8d076ccd4dd158c9','229400ebd07249a6815a37ee0dce4710','card_type','è¯ä»¶ç±»å‹','int(11)','String','cardType','0','1','1','1','0','0','=','select','card_type',NULL,70,'1','2016-07-21 17:20:40','1','2016-07-21 17:20:40',NULL,'1'),('e3ca0ac131594048ba791867fab1c233','1e4e3d1a4a61423a86949011843ec4ed','update_by','æ›´æ–°è€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','1','1','1','0','0','=','input','',NULL,60,'1','2016-07-19 11:04:55','1','2016-07-19 11:04:55',NULL,'1'),('e506753ed54346019ccbc339bcfadd7f','c3d9205399914896b72fea6cd962cd99','fpcity','å…¬å¸ç”µè¯-åŒºå·','char(5)','String','fpcity','0','1','1','1','0','0','=','input','',NULL,190,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('e5f4e4a7c48943eb80208273d4f6c01b','c3d9205399914896b72fea6cd962cd99','stature','èº«é«˜','int(11)','String','stature','0','1','1','1','0','0','=','input','',NULL,280,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('e6315f8c05fb487eadb58bda2233aa4d','1e4e3d1a4a61423a86949011843ec4ed','update_date','æ›´æ–°æ—¶é—´','datetime','java.util.Date','updateDate','0','1','1','1','1','0','=','dateselect','',NULL,70,'1','2016-07-19 11:04:55','1','2016-07-19 11:04:55',NULL,'1'),('e64050a2ebf041faa16f12dda5dcf784','6e05c389f3c6415ea34e55e9dfb28934','name','åç§°','nvarchar2(100)','String','name','0','1','1','1','1','1','like','input',NULL,NULL,3,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('e779d5d8aac542bd8ba06e89f599d94e','1c68860c5701474788d4627b05281a24','update_by','æ›´æ–°è€…','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','1','1','1','0','0','=','input','',NULL,100,'1','2016-07-18 20:40:48','1','2016-07-18 20:40:48',NULL,'0'),('e86b8652124d4a9c9dae918a9a04c4a0','6a1f05b34c3a46a6b0ef42f09c4271c8','sex','ç”¨æˆ·çš„æ€§åˆ«ï¼Œå€¼ä¸º1æ—¶æ˜¯ç”·æ€§ï¼Œå€¼ä¸º2æ—¶æ˜¯å¥³æ€§ï¼Œå€¼ä¸º0æ—¶æ˜¯æœªçŸ¥','varchar(200)','String','sex','0','1','1','1','0','0','=','input','',NULL,50,'1','2016-07-18 19:41:42','1','2016-07-18 19:41:42',NULL,'0'),('e8d11127952d4aa288bb3901fc83127f','43d6d5acffa14c258340ce6765e46c6f','del_flag','åˆ é™¤æ ‡è®°ï¼ˆ0ï¼šæ­£å¸¸ï¼›1ï¼šåˆ é™¤ï¼‰','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,13,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('e99263a3c8694b0cbdcd16159c9d58ea','341adfbbd1894a089be1196396428e20','card_type','è¯ä»¶ç±»å‹','int(11)','String','cardType','0','1','1','1','0','0','=','input','',NULL,100,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('eb2e5afd13f147a990d30e68e7f64e12','aef6f1fc948f4c9ab1c1b780bc471cc2','update_date','æ›´æ–°æ—¶é—´','timestamp(6)','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect',NULL,NULL,11,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('ec367714a28a424e81812ffe4f1fe0c0','3d721d0d5c424b5fac3c1ab702cfaf77','id','ç”¨æˆ·çš„æ ‡è¯†ï¼Œå¯¹å½“å‰å…¬ä¼—å·å”¯ä¸€','varchar(200)','String','id','1','0','1','0','0','0','=','input','',NULL,10,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('ec48f1f4f38e4fbe91b9c84a74f182b4','4146c299178d44dfb125f9637179fd9c','regip','regip','char(15)','String','regip','0','0','1','1','0','0','=','input','',NULL,90,'1','2016-07-19 11:00:49','1','2016-07-19 11:00:49',NULL,'1'),('ed6f8087d6d047699adc5fb0a450245d','341adfbbd1894a089be1196396428e20','salary','ç›®å‰å¹´è–ª','int(11)','String','salary','0','1','1','1','0','0','=','input','',NULL,140,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('edf307bbea924bc9877ea307df81a430','dbd4126e43eb4978b1e3099e920b4416','week','æ˜ŸæœŸ','varchar(64)','String','week','0','0','1','1','0','0','=','input','',NULL,30,'1','2016-08-01 17:50:52','1','2016-08-01 17:56:14',NULL,'0'),('ef6cc366d2a54d1bbc7336997b52dbc8','3d721d0d5c424b5fac3c1ab702cfaf77','work_year','å·¥ä½œå¹´é™','int(11)','String','workYear','0','1','1','1','0','0','=','input','',NULL,90,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('f134763f93b040489ee80da3ddd05860','1e4e3d1a4a61423a86949011843ec4ed','phone','æ‰‹æœºå·','varchar(200)','String','phone','0','1','1','1','0','0','=','input','',NULL,20,'1','2016-07-19 11:04:55','1','2016-07-19 11:04:55',NULL,'1'),('f1b737bd68644de2a8a493ef2f159d3a','341adfbbd1894a089be1196396428e20','zip_code','é‚®ç¼–','char(6)','String','zipCode','0','1','1','1','0','0','=','input','',NULL,310,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('f3a1338a65fd43e480bc35b1a378bfb1','341adfbbd1894a089be1196396428e20','idnumber','è¯ä»¶å·','varchar(25)','String','idnumber','0','1','1','1','0','0','=','input','',NULL,110,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('f428612326264a0482651a834b9bc83d','1c68860c5701474788d4627b05281a24','id','ç¼–å·','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,10,'1','2016-07-18 20:40:48','1','2016-07-18 20:40:48',NULL,'0'),('f4a9d305b9c944d3a9357d40eaa4d119','1c68860c5701474788d4627b05281a24','status','çŠ¶æ€','char(1)','String','status','0','0','1','1','0','0','=','input','',NULL,130,'1','2016-07-18 20:40:48','1','2016-07-18 20:40:48',NULL,'0'),('f4e65bd730154099a25761073d3f72aa','dbd4126e43eb4978b1e3099e920b4416','clock_out','ä¸‹ç­æ‰“å¡','varchar(64)','String','clockOut','0','1','1','1','0','0','=','input','',NULL,50,'1','2016-08-01 17:50:52','1','2016-08-01 17:56:14',NULL,'0'),('f543e02fbec64893835763daf0aa01f0','c3d9205399914896b72fea6cd962cd99','marrige','å©šå§»çŠ¶å†µ','int(11)','String','marrige','0','1','1','1','0','0','=','input','',NULL,290,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('f599cca8168145d58a115f062cf64209','4146c299178d44dfb125f9637179fd9c','lastloginip','lastloginip','int(10)','String','lastloginip','0','0','1','1','0','0','=','input','',NULL,110,'1','2016-07-19 11:00:49','1','2016-07-19 11:00:49',NULL,'1'),('f59ec7875fc441d9b2f8ab51d2f9527d','c3d9205399914896b72fea6cd962cd99','location','å±…ä½åœ°','varchar(150)','String','location','0','1','1','1','0','0','=','input','',NULL,120,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('f5d9264b3c0348c1925a349291acb262','229400ebd07249a6815a37ee0dce4710','email','email','varchar(80)','String','email','0','1','1','1','0','0','=','input','',NULL,100,'1','2016-07-21 17:20:40','1','2016-07-21 17:20:40',NULL,'1'),('f5ed8c82bad0413fbfcccefa95931358','f6e4dafaa72f4c509636484715f33a96','remarks','å¤‡æ³¨ä¿¡æ¯','nvarchar2(255)','String','remarks','0','1','1','1','1','0','=','textarea',NULL,NULL,10,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('f7761d6f40b147e09a938cdb0918f092','1c68860c5701474788d4627b05281a24','create_date','åˆ›å»ºæ—¶é—´','datetime','java.util.Date','createDate','0','1','1','0','0','0','=','dateselect','',NULL,90,'1','2016-07-18 20:40:48','1','2016-07-18 20:40:48',NULL,'0'),('f95c472c6dae4e779081aaceedd2d45d','229400ebd07249a6815a37ee0dce4710','id','ç”¨æˆ·çš„æ ‡è¯†ï¼Œå¯¹å½“å‰å…¬ä¼—å·å”¯ä¸€','varchar(200)','String','id','1','0','1','0','0','0','=','input','',NULL,10,'1','2016-07-21 17:20:40','1','2016-07-21 17:20:40',NULL,'1'),('f9ad45d4f07d40bf915115bb5a1add94','3d721d0d5c424b5fac3c1ab702cfaf77','card_type','è¯ä»¶ç±»å‹','int(11)','String','cardType','0','1','1','1','0','0','=','input','',NULL,100,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('fa47b1c34e0248139a3fe4fe01e4125d','c3d9205399914896b72fea6cd962cd99','day_of_birthday','å‡ºç”Ÿæ—¥æœŸ-æ—¥','char(2)','String','dayOfBirthday','0','1','1','1','0','0','=','input','',NULL,80,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('fe58c2d0d9294262a536feb463184918','6a1f05b34c3a46a6b0ef42f09c4271c8','groupid','ç”¨æˆ·æ‰€åœ¨çš„åˆ†ç»„IDï¼ˆå…¼å®¹æ—§çš„ç”¨æˆ·åˆ†ç»„æ¥å£ï¼‰','varchar(200)','String','groupid','0','1','1','1','0','0','=','input','',NULL,140,'1','2016-07-18 19:41:42','1','2016-07-18 19:41:42',NULL,'0');
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_template`
--

DROP TABLE IF EXISTS `gen_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_template` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `name` varchar(200) DEFAULT NULL COMMENT 'åç§°',
  `category` varchar(2000) DEFAULT NULL COMMENT 'åˆ†ç±»',
  `file_path` varchar(500) DEFAULT NULL COMMENT 'ç”Ÿæˆæ–‡ä»¶è·¯å¾„',
  `file_name` varchar(200) DEFAULT NULL COMMENT 'ç”Ÿæˆæ–‡ä»¶å',
  `content` text COMMENT 'å†…å®¹',
  `create_by` varchar(64) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°ï¼ˆ0ï¼šæ­£å¸¸ï¼›1ï¼šåˆ é™¤ï¼‰',
  PRIMARY KEY (`id`),
  KEY `gen_template_del_falg` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ä»£ç æ¨¡æ¿è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_template`
--

LOCK TABLES `gen_template` WRITE;
/*!40000 ALTER TABLE `gen_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `gen_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_qiandao`
--

DROP TABLE IF EXISTS `hr_qiandao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_qiandao` (
  `id` varchar(200) NOT NULL COMMENT 'ç”¨æˆ·çš„æ ‡è¯†ï¼Œå¯¹å½“å‰å…¬ä¼—å·å”¯ä¸€',
  `date` varchar(64) NOT NULL COMMENT 'æ—¥æœŸ',
  `week` varchar(64) NOT NULL COMMENT 'æ˜ŸæœŸ',
  `clock_in` varchar(64) DEFAULT 'ç¼ºå‹¤' COMMENT 'ä¸Šç­æ‰“å¡',
  `clock_out` varchar(64) DEFAULT 'ç¼ºå‹¤' COMMENT 'ä¸‹ç­æ‰“å¡',
  `user_id` varchar(64) NOT NULL COMMENT 'æ‰€å±ç”¨æˆ·',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_qiandao`
--

LOCK TABLES `hr_qiandao` WRITE;
/*!40000 ALTER TABLE `hr_qiandao` DISABLE KEYS */;
INSERT INTO `hr_qiandao` VALUES ('0106c47645c24479a488808070ade586','2016-08-25','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('03595ef31ec04db7969f543777c0b787','2016-08-04','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('04960475b96045469c5d3cb9f6d13ef6','2016-08-13','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('07189e184f18433db20c6b1ea8569450','2016-08-24','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('07aafa945e5f4a6491bf19b5876c8fc6','2016-08-07','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('08f9412bd3a441a6929ccca38e918124','2016-08-31','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('09c537997df34f9b88f36768a0253f5c','2016-08-30','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('0ad2c578e21847789fdcd1e7d9dfa603','2016-08-18','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('0b84a7df0c6047b4831d0c5af2f47ec0','2016-08-30','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('0b958c2ee9a74b6a84bf331b9e5a3856','2016-08-10','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('0c295e6a3e2840b4989998ea472b9280','2016-08-28','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('0c44ae52f92342d6a3377f3cb77b41a6','2016-08-21','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('0cd6c0c1c9724dee893f4cb06434e3a3','2016-08-29','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('0d238ff959334eb4877c9835dd25e2f0','2016-08-10','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0'),('0d97e1d9903b457aa55d6dcd3b09cb84','2016-08-05','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('0de91a9c2a834336a3e2402720342d3f','2016-08-09','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15',NULL,'0'),('0e0207d3ad554430afcc6766a1a7d85f','2016-08-12','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('0e499e552eca4a139a1b81b593a73ba2','2016-08-02','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('0edf07ece5004fff9b778b12eb1a5fce','2016-08-30','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('0f19ff71681e4c0395f26c6571f6b80b','2016-08-18','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('0f917e0d8b014ac0ba222d9f7e00c9d8','2016-08-18','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('107b2bedf3794a78813915723cfe5db2','2016-08-25','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0'),('1107aaa771f8435f8974943cea1acd89','2016-08-14','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('11ca4be618b547f789e5b09e3be6b81a','2016-08-21','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('11feb810d96948dd8d25b05a9168af8c','2016-08-16','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('1283524a53b24c709181267e76f31e4a','2016-08-25','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:16','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:16',NULL,'0'),('12d1c218ec3a4697abd0ca27dfe5f9e3','2016-08-22','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('131edc5abcaa43eb82196e4a14bc0f67','2016-08-04','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('136052ca5ad34f31b8b5ee559975ae35','2016-08-14','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0'),('138a7526f98e4488ac5cfdea73274b7b','2016-08-17','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('147ed988da624eb0be5b4b1af0e8bc5a','2016-08-13','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('14c0e5616a4f41c4aa01f9579650aa92','2016-08-07','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('1633780941cd4a97993663ca610a1621','2016-08-31','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('1643d744274942aa945687d55d8a764b','2016-08-21','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('1650f8600236456ca9747f8a0f0c0123','2016-08-02','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('167df560b8cb42f6be27de7d031a2350','2016-08-20','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('16b9f329de524d2ba1c036f8787c3576','2016-08-19','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('16f7ce5aca844850868776e8dc9e1281','2016-08-28','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('18ccb89a69014ffa882be1f5a33219e1','2016-08-13','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('1926f0ee61f74f8f939e5ce2242cc631','2016-08-12','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('19272f61f42741408ff298eb72aec8c0','2016-08-30','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('19646b54cbec44f5a1fedb357b2ac3a5','2016-08-17','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0'),('198871c376cc4d408fbf81b45cb3b13e','2016-08-23','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('19ff4c7243b24acb8835542686cc95a5','2016-08-21','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('1a2b2241c94344a1b6b7042393ec59aa','2016-08-07','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('1a439c9e34924d5eb3d10319167a77c6','2016-08-06','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('1a8ff293e22d42ac93a9371b56e1403b','2016-08-29','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:16','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:16',NULL,'0'),('1b2e28dca02245ec863489529aa8a4ff','2016-08-18','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0'),('1b44c06d57ed46fe8b8d2c8d28bb465b','2016-08-13','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('1b7123fb7e8c4435a585f746f34ac4d9','2016-08-13','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15',NULL,'0'),('1ba6d47541444147bbcfd84a13da74ae','2016-08-20','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('1c3d21286fe64d1b8abd35d621bb95c9','2016-08-12','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('1c44273ee70f4b93a83ede7a3c2e5343','2016-08-04','æ˜ŸæœŸå››','17:14:32','17:14:32','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15','5cbc0c90dca846b88ab0b8a547006df2','2016-08-04 17:14:32',NULL,'0'),('1d737a697aa5408e9a1a37ed6e014230','2016-08-30','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('1de8230194324636939325cf454ab882','2016-08-09','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('1ea0a3dc37ef4eba81ea49e585a4b616','2016-08-15','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('1fc275b3757d404fa2b5fbe69f012ebb','2016-08-12','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15',NULL,'0'),('1fd73ea081b240eb9bef20e7c5115696','2016-08-20','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('203cf76aa915458c85f8708d2170dab8','2016-08-04','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('2225496b32c54b87a61d031fccd63d80','2016-08-20','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('22326430a9cf4483a56fd7e3dfa131d6','2016-08-11','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('223c3e2cb37b443c98777ec0abfba513','2016-08-08','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0'),('23debfeee322401b941dbdd29a72fcae','2016-08-06','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('23eab44662a54623abad101487b3590b','2016-08-20','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('2423fc6909de41f88008e8bfc0ca118c','2016-08-18','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('2472b26283324278b962e1a901f2c2bc','2016-08-14','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15',NULL,'0'),('24a82a2092d54c1998db0d3324078db0','2016-08-27','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('254a80a0e036467ab8af1961aec8c548','2016-08-20','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('2551d5467a2146d59ad7fcb97ed85325','2016-08-19','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('25b6236c15df4a08a6c37128f3c8c715','2016-08-15','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('26e6508913c346eb868a29a17eaed6d1','2016-08-13','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('27c58eff9623432c9bc3baac97440b45','2016-08-16','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('27f21109c7f6453e8ea1184f7d79f2fc','2016-08-21','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('28e3974696364ee280c6cc6459cff869','2016-08-29','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('2a9260d2b39b4f7e9d8695453564199a','2016-08-03','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('2b32dbc8d2e24889b05f8feffee09f2e','2016-08-16','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('2bb1b7b8135b4d6ea58259b02d79ac4d','2016-08-31','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('2c91c73857da4ddd85883cc40742ae4c','2016-08-14','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('2e6180189c774bab98401d0bfe67cda3','2016-08-21','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0'),('2e79275cfc2342d6aecdaf16b059c049','2016-08-04','æ˜ŸæœŸå››','19:39:39','19:39:39','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:17','7cfec60bc9c947f284bff8a0247fb500','2016-08-04 19:39:40',NULL,'0'),('2f2660e7cc794703b213ab515d3e7b5e','2016-08-14','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('2fa04a1a29464bd999e776588b75ca4b','2016-08-19','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('2ffac67afcef44e7b5ba4ee5acf97bdc','2016-08-10','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('3089abdf67184d36a773ecc08504cafa','2016-08-05','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('30a837fa5cd84095a2bf343f716ffa25','2016-08-09','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('3333057fcb124f2bac5676cbf4eee673','2016-08-10','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('333e912afc2e47f4bc4632c2f6c0e691','2016-08-08','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('3342f2c634c64ce9bd2363a28d3788e3','2016-08-14','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('344634a9d57f43859f5d2dbe2099a4a0','2016-08-05','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:17','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:17',NULL,'0'),('348d23ac261246b7a106c6e734d44715','2016-08-10','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('34d931c922034b589c4b6497f7495316','2016-08-30','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('350766f398184824a66ccd596bdf11ba','2016-08-23','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('356ede79ced84ef0bfbab5a1fafb5e2a','2016-08-29','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('382e6e1fb44a4c9096ab93eeab8e000e','2016-08-25','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('3a1629d971f6411aa811f05163a0a00d','2016-08-24','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0'),('3b375cf0f80f455c8e3bf656d22ea65d','2016-08-20','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0'),('3b5c598c58af4d73896517d628bf6064','2016-08-26','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('3bbe82ec54464470bd09ded08e7fb9fd','2016-08-09','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('3c81244170d145989d82ae01d56fe950','2016-08-28','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('3ccd3a98fdd3493ca4e5633b0fc3ab30','2016-08-17','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('3d322b061bf54dc1a4097c1dc5148fb6','2016-08-26','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('3dde4d6b73344673af2f448044925b8d','2016-08-11','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('3e0d754863734c1abba9e4623e62751e','2016-08-27','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('3eb9f4b3563843f898054cbd13e6f4de','2016-08-05','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('3ef8fabbd75140e4b907288fa3d8c057','2016-08-18','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('3f21e63825054117ae64e67ce5388d28','2016-08-09','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('3f30853d3654491990dea6b4c369c569','2016-08-23','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('4124c02585974a02b3ed3d011b03c37d','2016-08-26','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('41a7cd8d599843a89bb9f3acfc35dff3','2016-08-17','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('4329404ceb23401896bcda333ae76ddc','2016-08-19','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('43ceef07ca884d5192d7eb4e03f5dfab','2016-08-05','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15',NULL,'0'),('43e9590432144cedbf8903104bdd472a','2016-08-12','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('459308bc00544c7aa1331bbf4c8d409c','2016-08-20','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15',NULL,'0'),('463b8f1ef76c45408a846d69c7c69b8f','2016-08-17','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('463ddf7769a34786a22bec79bcc8c656','2016-08-13','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('46408c3f5d4a48df9ab616f9bbd69c57','2016-08-27','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('47085c3df51d4301839e6681e1e8547d','2016-08-22','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0'),('4748225bf7dc464bb0351e5a8f03d15b','2016-08-28','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('4752757975154f859bbc44cdd323a823','2016-08-17','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('478a7516b4a74cc4b379b1dbc88db8f0','2016-08-24','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('47b8519e58bf4df4b122c96872fe3c82','2016-08-06','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15',NULL,'0'),('4996a06df8f64dce94c01aa2a375ae9f','2016-08-20','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('49b50a51c0e44825bf0531953904f9e0','2016-08-26','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('4a5034fbfe7b48048e3f3dc7b6f723fd','2016-08-02','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('4ac40c3b7c5c4b1b9698e187f92cd049','2016-08-20','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('4b9685d7200d47d3b3672551dda178fe','2016-08-12','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('4ba998b33d594a52ad2c83f793c3a307','2016-08-10','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('4badae06da3d4aefb1731cc4e4108a64','2016-08-31','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('4c37960b326e41669e63652d5ab0deea','2016-08-19','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15',NULL,'0'),('4ca2130e1c194e0fae0ffbc50e99d320','2016-08-27','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('4cbe283285b0417fbcb9b97353e2169a','2016-08-27','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:16','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:16',NULL,'0'),('4e485a818f514f87938ea536d21473f3','2016-08-22','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('4e5e7a156a7440f0bd1cc85fb3540923','2016-08-25','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('4ec08a1deb784084a2cc60b7e4455575','2016-08-14','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('4f16868517344326932fc8b230eab724','2016-08-10','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('4f77e6a4f35645bdb703ace4fc1f6552','2016-08-06','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('4f7b7be36e7346acbb80fea922fe2235','2016-08-20','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('4fbdcbcea87a454dbc492bf785321e89','2016-08-07','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('4fc0f5f906174af9b91781dc008a0142','2016-08-07','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('506a388b81024d9dab734fb33209fd83','2016-08-24','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15',NULL,'0'),('50cb1034f76547cdab99f6cefc1ca858','2016-08-09','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('50eb774d33d4443ba0865dacc794fe95','2016-08-26','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('518571bf71d74404a3fbe165d5d36cfe','2016-08-21','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('51b3f2e4319345849edc57e74c9f7351','2016-08-08','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('51fd64c0853342a9968cfe50ca44c838','2016-08-07','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('53c8a3877206412b8df2f6a6d25ad306','2016-08-21','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15',NULL,'0'),('548dc227f7674fa6a1364a936ff1f4c9','2016-08-12','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('55383cb7b8d84ac3b30485ab56ff7af0','2016-08-26','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('55ed55eb37a44761b8b1ced299189f37','2016-08-14','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0'),('56bde624f8914f7db317a0199877c84a','2016-08-07','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('5760c36c48f64ba1abc6d5d6a0d6f654','2016-08-15','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0'),('579bc63c07264b1b849c6ecefdaa002c','2016-08-04','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('58eff7423cad498289ad7625e63ce312','2016-08-28','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('5951c5c6c8ca49c798a165aadbcec8c0','2016-08-15','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15',NULL,'0'),('59d1e6538679438c9cb4e4a95ebbd745','2016-08-10','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('5a097a4b9d6a4af7851e289181a687a7','2016-08-29','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('5a33d421091f43568dedb0e10016b12d','2016-08-28','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0'),('5a5f7209889844df8f050cb38d6a2950','2016-08-21','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('5acc8cd9551a4ea686359f8646c43aea','2016-08-06','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('5c144e1299b24347aaf68b75f9b09494','2016-08-04','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('5cf595b64eb94854a2acd7bf12abc136','2016-08-31','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0'),('5d214083910b4b9bb13cb1bfb423d965','2016-08-09','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('5d8795e5d88844edbdb8aa971ca8aec7','2016-08-26','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('5e22721a293f4526812f1aa0c006d6be','2016-08-25','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('5e7477ca7d2b44a382b0a4c514d2a9c6','2016-08-21','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('5ed56ea040804371a1490d804801b95e','2016-08-06','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('5f10b20bffc146dea8a1ab6fc8935bf7','2016-08-31','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('5f6bfaf7627c47f684dc2bf1a622194a','2016-08-16','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15',NULL,'0'),('5fb7b4a4b941423c8e55b9e90544b6c8','2016-08-15','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('60a3f64e6bd24a1b858ddafe7889036a','2016-08-23','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('61d55e87619448b6b8df1ed3bb29ca63','2016-08-02','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('63d948ccb36548cc955250e50418590f','2016-08-08','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('641c1ec619c14ecfba5d217cd8bd6854','2016-08-11','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('641e38a5d37b4943945429175a320e9c','2016-08-04','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('6440149f5d584faa8a8079329abc16b1','2016-08-24','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('646d0a11e74f4c18af0027847ad61d58','2016-08-19','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0'),('64babf5eda364b92937308592e9c5051','2016-08-02','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('65212f5861864cac8191d08043857d39','2016-08-31','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('6554f8491e00417dae7497586e10f05e','2016-08-30','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0'),('65e7549562484d2a8881cc22c82b94e0','2016-08-27','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('6813c86dc2b1487da58f23e8ea00c4ea','2016-08-15','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('68b2df4e4c2a4eec83fb3012e10ddd32','2016-08-10','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0'),('699cce35216f482e80f673662f7f107b','2016-08-21','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('6a522f651c01438fb6b8b1c9c24d0197','2016-08-27','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0'),('6aa515ee84b34a61ad6f4b9419394491','2016-08-16','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('6b3dcaff21e34bb8b50e1d60d25ef8fc','2016-08-05','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('6b78bf6fe651443982ad208ceba0c657','2016-08-03','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('6ca8e45984f94dc683f2060708b06b9c','2016-08-23','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('6d8e28bf844b4ea1aaf58f4c93a1942f','2016-08-15','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('6d959a9cbd0a4336bbad27a8479b1666','2016-08-14','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('6e7729b0aeeb4b7fb6efb951ff24d087','2016-08-30','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('6ee330d515e94a43892f9074d8b6a013','2016-08-23','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15',NULL,'0'),('6efb45fb632f485f841f8d5245c24fe0','2016-08-03','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('6f60224dd99a4b42ad9b97b4b0984d0e','2016-08-11','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15',NULL,'0'),('6f7228c2f8fe4148961d96e692ff23c8','2016-08-10','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('6f977b417a294d5ea6b3523b6c6bd93b','2016-08-23','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('71129336ed144f65843399abb715ced9','2016-08-30','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:16','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:16',NULL,'0'),('7133671f3353430ba26a4c4d0fe31eca','2016-08-18','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('717d4889ffc543c1be2d6cd6691738d3','2016-08-25','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('719fb72364244baa9ad720a9d84cff61','2016-08-29','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('7212d1210c804f708b12eb46aa14aeee','2016-08-09','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('727082c52bcc4850bde980573cf8d56b','2016-08-14','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('72ca16fe03ca48368ed3785cc936bb54','2016-08-13','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('736adc4ff2834401a3266bef52ea7922','2016-08-26','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('739d81a66180437bab6353a8f452c39b','2016-08-27','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('7406e8272edd485c896a219e21e3307e','2016-08-09','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0'),('743130aa7adc4e15a5e49b5c9862fc34','2016-08-29','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('74976dea46b34af490ca8b81c4343183','2016-08-08','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('749c6baa3aed4c3f8170655d91138265','2016-08-15','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('76ecaf0702bc47929e2e0c744d1dbb5f','2016-08-28','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('76fd2736d4004a37aaf3f38e80acf222','2016-08-05','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('77e306f46dbb48098e9a4491519f6a24','2016-08-25','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('77feabbead594a3f95fbd74b4bcd3af8','2016-08-29','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0'),('78dcfefad5c040da96025813d22d4219','2016-08-29','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('79e998d67e684f2a9048a1508b154a92','2016-08-19','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('7a4366e7e20941f5b8fbb8e3c95242b1','2016-08-10','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('7b4e235148354c5d8384a5f725b4d19b','2016-08-31','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:16','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:16',NULL,'0'),('7b60abd25994441692644b76e6ceaf14','2016-08-24','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('7c438568e2e14545a1d8d02ec43a11b5','2016-08-22','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0'),('7d41e6ebbef34429900d06549e6e4391','2016-08-14','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('7db1e5ef78224cbea81511da9f965210','2016-08-26','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('7de94e1716724ffcba632640a189220b','2016-08-14','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('7e93906a55ce46928fa4e9f0c1be0ba1','2016-08-08','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('7ecd471063964feab7dd4e6ea005c6d7','2016-08-11','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('810983b6b47f4c7e9f330a920c9622ff','2016-08-07','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0'),('813dc23d54474d999dac12cc53741d89','2016-08-06','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0'),('8160754b721f4cba8adecd504ba54bac','2016-08-06','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('819e69ba48824dbab84d1068985c30a8','2016-08-22','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('81ae5e17e88a4136b1bcdc56c6ced516','2016-08-20','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('82b1b5baf3bc42a587cda9992799cbc8','2016-08-18','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15',NULL,'0'),('82c8a8b71a184adaa1a69876a015165a','2016-08-02','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('83573ade0e944f829b72dd3af86fd68c','2016-08-13','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('83f449623bea498998a5f692cda465be','2016-08-11','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('84418bb15c994c71b587b2d36a88a883','2016-08-22','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('85181a79fba3445caad8db1deadc6ee4','2016-08-20','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('85370660ed5d42bf8e19c8117ac62000','2016-08-02','æ˜ŸæœŸäºŒ','14:13:26','14:56:05','1','1','2016-08-02 14:07:07','1','2016-08-02 14:56:06',NULL,'0'),('856f6b94261c4290b2b31256d56ecde1','2016-08-04','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('867305e04bc04a6d8bf6775e282d3db9','2016-08-03','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('86a3ee31d685492783e20edea929f49a','2016-08-16','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('875255678c30488d9cdfdd58d28691f4','2016-08-12','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('8868a44bca1241b1ae9cc2ea8da57c87','2016-08-12','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('88d5f960d3214826abbc6acccb6c590c','2016-08-09','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('88f0f56ae3cd49cea8f953119d291387','2016-08-16','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0'),('8a199c02752543af8d0f15ba7d632d38','2016-08-24','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('8a4d118ad6ce4be5a1b679889935cad0','2016-08-03','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('8b74ee10a4454fada88e432547d76d69','2016-08-02','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('8b95a897fea048269694bc2ac8d9e002','2016-08-20','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0'),('8c9835e82eaa494fbf63005ac2accea1','2016-08-17','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('8cbb1d9a77e843678fee19a96a5d7542','2016-08-31','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('8d0dbca514704091a37d262c44dd9e78','2016-08-18','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('8d7a3de088af41f99052ccb18c4d3e1c','2016-08-15','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0'),('8dec1a77e1a44ca1ae1781ec6102e2f5','2016-08-23','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('8e129459c2ba431095eb735d17112670','2016-08-18','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('8e3346cc8e1d4750b3d6677a59d63fe5','2016-08-24','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('8ee7e69267464df09b14abaa82bf5ef2','2016-08-03','æ˜ŸæœŸä¸‰','10:33:11','11:34:17','1','1','2016-08-02 14:07:07','1','2016-08-03 11:34:17',NULL,'0'),('8f6bb82947004af79224b9441eb8acb3','2016-08-31','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('8f706a12815b47d5905b26f7286c6339','2016-08-02','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('8fb80be72b614130a17f21822c5f0078','2016-08-26','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('9024ec817b514073a3d06125310a955e','2016-08-28','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('90505ba813bf4555a6be0e686a69947f','2016-08-25','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('90c74aec158047de85aa4f4b593d15fb','2016-08-08','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('9101a9b01712400bbd94076a0e80f493','2016-08-04','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('9128948d55414b4f819428e206231e52','2016-08-05','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0'),('91ca89739d524e488655ae2f60498e29','2016-08-03','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('925b5ddb751f4669b2c3ea6f7f3678f9','2016-08-13','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('941926d728a84bf89410311b582682c2','2016-08-02','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('943958f95d7f4e178acc588467c9c5a1','2016-08-28','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:16','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:16',NULL,'0'),('954dbb5538fa4bd4930c54679956f44c','2016-08-05','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('95d4eb4be1fa46258c3222c1884bfcf5','2016-08-17','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('9623aa45379c445da4cbb11315abd672','2016-08-29','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('97041c5121d446ad965bb6e09192925b','2016-08-07','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('9734c7b624b04118977e4d0703567977','2016-08-10','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('977178ddc9b14583a8a55b1be1d721f3','2016-08-24','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('9772131d4cd2437da80336440eb42f13','2016-08-24','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0'),('9861eefe03484a32953f99ad88005aab','2016-08-07','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15',NULL,'0'),('98af124fe19f46a8bbaf6a1d203dfa69','2016-08-19','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('9974356ed3c14e57a91ebbfcfa1f48b5','2016-08-08','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('9a38cf224629491284b9d2601a666230','2016-08-28','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('9a59bbd3a0bc4f5c8868edd387482298','2016-08-08','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15',NULL,'0'),('9a84cfb0fa0943c4ae65e49eb0048391','2016-08-06','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('9b0bd70287c14a07aeb24686a508b714','2016-08-18','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('9c0da417766e415b943d2ac74f4d7cbb','2016-08-11','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('9c5ba8880ca54100b59095be51573172','2016-08-29','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('9c9d491e1ff2470dbdfc230dfd982a27','2016-08-05','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('9df52cbfdb6c4510951b6e64af0e83ed','2016-08-24','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('9e5f9747545b458f9428e4a18fbef90b','2016-08-25','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0'),('9e8a1a0719cd4114bb771603ac1b27ee','2016-08-14','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('9f9204c8ecd64fe89c6d129dd153736f','2016-08-27','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('9fddbad0146d4d1eb45c7f4d95ffa6e4','2016-08-12','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('9ff2231f17954f2482e854e6850be4a8','2016-08-19','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('a1b8b23ff77540e08f30602f0932e13a','2016-08-10','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('a2002b708ced427197d00e5ed4fd30b0','2016-08-23','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('a22b4a1b34e7408296a4d647b5207ca8','2016-08-07','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0'),('a2a132b64d9e405da2fd473bc0253c2d','2016-08-02','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('a312b7e21aac43f79135ab1a389909fd','2016-08-07','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('a3205ea9280b4a7098a0c3e75b155705','2016-08-17','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('a329f915be294c7c8243dc81d1428cfe','2016-08-21','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('a3938fcca91846ab9f451b0f1f94f242','2016-08-24','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('a39499d35ba644719c07ad903b419485','2016-08-18','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('a42fb4da1fb64eaeaa6197340e2b1000','2016-08-23','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0'),('a48da441898a4a3180dbe9515a51cbeb','2016-08-20','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('a5dacca91851474898fda8028f9badce','2016-08-17','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('a7335f3716554b2f80b08e4231ee8584','2016-08-31','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('a857991c9c2d43c6a00ae3360f60d47c','2016-08-27','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0'),('a866e5d28d03434dabd66e0fc12420ce','2016-08-05','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('a886d06c38934048bda6a354fbd058f9','2016-08-13','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('a967310c93e24ea3a9db825b7f0185ac','2016-08-24','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('a979e895012a44f8ae83844fd5969238','2016-08-15','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('aac1e6748d424cdfa222c0e6d6e45946','2016-08-24','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('aad48143fd574863b1896152a82745b0','2016-08-25','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('ac65e6644f5340c6b76bd6c84c7960af','2016-08-27','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('ac7766138d7d42938dd74cfa3f9d74ec','2016-08-16','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('ac7bb6333d1d4042a1a65547e7214dd2','2016-08-08','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('acb0c3cc6f1849b59d67ae58bd8b4a3d','2016-08-27','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('acd1a695df964322a0e34bf92c747518','2016-08-27','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('aeeed29565194f629610bc4c9940eac2','2016-08-24','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('b07cdc5ded474a4b9e82005345648baa','2016-08-12','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('b1e26b9ec9944850885941f92a33dcf0','2016-08-08','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('b2fe21ab03bb411085860cc5c70ce580','2016-08-21','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('b31aa8a0f2924bdb9899906cd7d6de6e','2016-08-05','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('b346f69f45c0454cb333025ae6c04049','2016-08-11','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0'),('b3d334107ac44f68bed91efe1b21f284','2016-08-10','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15',NULL,'0'),('b466b500042f41b4891fa6a9dc616036','2016-08-11','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0'),('b4e53156906d485aade4e45ab394be2f','2016-08-12','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0'),('b5a235260eb94d689efa38a5b112d8df','2016-08-19','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('b5adb5c5f8494ecb98228d07002b9c9e','2016-08-03','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('b6150bc048d446cabc7b2e6702b427cf','2016-08-05','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('b66eac02dfb5474380c7825b156b3567','2016-08-19','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('b87222694a144d54a613f4182e4d397f','2016-08-25','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('b8b4fc5f6f3f4a13b60455950a159ae5','2016-08-31','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0'),('b963653cd6d14154a970ad33915ae5b9','2016-08-25','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('b9a258d07be9413d800c5912616f055b','2016-08-06','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('ba2d98339b7f4d58aea0f9970ff0baad','2016-08-29','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0'),('ba61ac44706047e88ac0015ff33a1a9a','2016-08-17','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0'),('ba6acd1ac0ae4b518776554e0707581b','2016-08-22','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('badf03f2484745c7aecfa9fb2a435d0e','2016-08-25','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('bb5ecef69c2d45dbb99a279fd0613134','2016-08-12','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('bbf5c031d5934b8fb434a39a87354b7d','2016-08-31','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('bc2899c7492042b7b15124a30a6d5529','2016-08-07','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('bc2b456350df4cb094e41188d591c06c','2016-08-05','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('bcde3ad4c781423e8c191ccb6c13530d','2016-08-14','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('be01fcea7f0241a49dace37030f3e6b1','2016-08-16','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('be53c83b905b4e35a6e3e890dae3cd77','2016-08-26','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0'),('bffd8c6d6ddc48fdba1bf8e8f73c3594','2016-08-05','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('c022e246e16f4b82b61f8709c9654da4','2016-08-28','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0'),('c134eb900e364665808a1b3ecbb4b569','2016-08-10','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('c18c8df74b4f483a859ee6c2e3b67802','2016-08-28','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('c1f33de577264f41b77012cba6b7c4a7','2016-08-11','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('c27c64a1d5094949888971c27bc84a84','2016-08-17','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('c342a38a95b34121a8a8df5aa4b9a236','2016-08-15','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('c38eb74f4b00494c9dd98606668bde4c','2016-08-06','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('c3f1d377fac9486386554e61e3454aed','2016-08-26','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('c3fe3815362845a9a81dcadd7eaa8e07','2016-08-16','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('c462bbfed3824f07bce72c72e0ab9818','2016-08-06','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('c4a9454e50c542d5909e25baf3bd6635','2016-08-10','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('c5e81c2e0fe24425b8d7cecad1dd656c','2016-08-09','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('c7054be1abf44cd2b1a83b3dd3cd280e','2016-08-14','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('c735c67beefd43fc8a18ecbe8338c2b5','2016-08-24','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('c7decab53cec4cc4b1fe38c3c758114c','2016-08-23','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('c8de75685ce64394b84c55d7d9297bd1','2016-08-22','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('c984feb1cc5b4dc69cffcd18a04ee16c','2016-08-15','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('cad9ec5ca27e49faa182161154a8c6cc','2016-08-19','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('cc9c9fb5703c4500965dd7b64763d299','2016-08-26','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0'),('cce20f491c344d1aa6d31f412afd2720','2016-08-27','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('cda1084a37f44c70bb774073d1a8d0e6','2016-08-31','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('ceef80efb39b4a66b2a213ba2dfd13aa','2016-08-12','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('cf71c5c0bff145748e271bdb1255686f','2016-08-26','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:16','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:16',NULL,'0'),('d01fe5ae478b42c7a830a957fc0b8ae6','2016-08-09','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('d04dddc3039249f69c1c760f5576284f','2016-08-23','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('d09d1c02d99145009c284deb2f665253','2016-08-30','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('d0e64be877a843e4975d573b76883325','2016-08-16','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('d11382342fcd4bebb2184458d42ad04f','2016-08-04','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('d1a27bc3a160495eaa75eee9ddd9e512','2016-08-15','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('d252346a8fb948369cf3b4d07fd26bdd','2016-08-04','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('d301e759433b4daa9c5af1b3d651b44f','2016-08-09','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('d36b8c89558c40d7b9093df7bf5b11cc','2016-08-07','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('d57d94f5278548ec9451823b5855062e','2016-08-11','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('d653aaa9f19b46658e395b99d87e8eac','2016-08-27','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('d71b2bd491224577ba0ab23db1619a06','2016-08-03','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('d7938e446ca1426b88951309c4c884d7','2016-08-19','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('d80e5b9f462e43a3ba51656eeac00dba','2016-08-26','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('d8bfb2ef09464227ac1dfb3f4b3286ec','2016-08-17','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('d8ca9169f6a54a87b37d2df6f3fb7258','2016-08-13','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('d9383313655b47cbaeb1a69dde8cf05d','2016-08-28','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('d94e036070654e96b1bf52ea56f6384e','2016-08-17','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('d969fade98654470bdd5d7dbb33854ad','2016-08-03','æ˜ŸæœŸä¸‰','14:24:22','15:05:22','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','54b732a7a8dd44c2b6745b64cf9e3e77','2016-08-03 15:05:23',NULL,'0'),('d99b613fc5c840b19271ada3436f0bc7','2016-08-30','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('da1e597eae864b8e93f53daf9e50d724','2016-08-23','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('da40ef6f5b024f948e648637a4d4395e','2016-08-17','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('da57075396c44ddb86a8e92a05d2198e','2016-08-15','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('dabc36d08470413dae6ae8ebd44f89e2','2016-08-05','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('dbe3307be0954f49a013a25d88f623d2','2016-08-19','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('dbeeeb77909d429ca63323bf170c77f9','2016-08-27','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('dc433943cd0d444fa83156cc10d0031f','2016-08-08','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('dc450c9610314b358468db0bac718caf','2016-08-29','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('dcf4bfd923134509aecfc4b70a923c76','2016-08-21','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('de9ba31690774578b15f69293f9ae96e','2016-08-26','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('df51081a1f374bd2be0e4d4e60980123','2016-08-28','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('df940a4bd4004c038a30629bc308f59c','2016-08-06','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0'),('dfa7fcd7f54b4cbcb7440fc13806e468','2016-08-19','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0'),('e00fefdfdfdd4027a601c0499b2bc570','2016-08-04','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('e0a2203169164385bc56adc8880a353e','2016-08-23','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0'),('e0cd97a129bc417d89c99c4a80227d02','2016-08-11','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('e0ed0ce3a9ec4635a7e824dd68e9b502','2016-08-18','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('e0f050090cae468db31e3b94875076f2','2016-08-22','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('e228e7f693aa42b1b6d72b66a746a6f5','2016-08-28','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('e33cd17decea475fbef3482a5255e4bf','2016-08-16','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('e3525b5a10b44057b9f44cbdd1e3ce69','2016-08-21','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0'),('e372505bece144099dde38584561703a','2016-08-11','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('e3b5c5b7fdb44568b70183732f339e0c','2016-08-06','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('e41205b9722a4c99830d1b71bbafea39','2016-08-09','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0'),('e42a1f69fa894654a99696a742c9da95','2016-08-30','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('e4df4e1cca0a4a498cf2df4d0fee7ef1','2016-08-21','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('e51d30f36a254a2e9e02c40ce59baed5','2016-08-25','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('e5a158bf34e74e55993a206ccc4a7680','2016-08-20','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('e641b9d9cadb406c90c01a62cfaa50eb','2016-08-08','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0'),('e6bffd06627545a584f7840c1dca71cf','2016-08-16','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('e7386d8010964d7c8ba34b15cd81c1cd','2016-08-16','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('e772bbbbad1e4102a8a4cec85b5a5376','2016-08-16','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('e80c9dad03da435abd06b495810834a5','2016-08-11','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('e88a6854cb0f45bd89bbfbb374420005','2016-08-12','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0'),('e8ab785bc7cc465d8d6137d1f4f4febc','2016-08-16','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0'),('e8efb6620010445fa3798ff24c393bb7','2016-08-07','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('e98e68f02140428ea0495e9a0e1e2c6f','2016-08-04','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('e9b387a09a504bb2a16d6b560cebad33','2016-08-31','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('ea2e5123797f4dfbb14224eade80a84a','2016-08-18','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('eb18831221aa49d684126bb06b99512a','2016-08-03','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('eb1d2391addd4684892d06bc113463f9','2016-08-13','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('eb57718496214349b44f14472c61915b','2016-08-31','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('ebbbff65d0834423b526a9929e22b5b5','2016-08-08','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('ec16dfb267364f6aaaf7789b569cc40c','2016-08-19','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('ec60357a076d4f1f9e6209dc4c06726e','2016-08-22','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('ed085e05610042148d50a12aaba9bdc1','2016-08-23','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('eda85e4f77cb4950a82a05ec7c8743e8','2016-08-03','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('ef663cbb61644263b41face20436c72d','2016-08-28','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('f08759d2cd674f598d0ed9b10eb3825e','2016-08-09','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('f12c546525ef4d75b0a567333335b15d','2016-08-15','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('f2623fe1c90e4eeb800dc2862fe17fde','2016-08-03','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('f296d371408641ffa4e3e43cafccca7a','2016-08-14','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('f3257a7788df48c9bd4168267e1ca1d3','2016-08-12','æ˜ŸæœŸäº”','ç¼ºå‹¤','ç¼ºå‹¤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('f428ea52664b45c786f3533a760d4a3a','2016-08-22','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('f494c66904384e6fa7b8c697a0dff38a','2016-08-29','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('f4d86c6cb168492087fe7017f4c31079','2016-08-30','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('f5643ed391a24df8b3a1f1eabd1034ee','2016-08-15','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('f633849487f84a4bb58ca4e1625b3119','2016-08-18','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0'),('f6737963db4e41d4a3adf2b39053e81e','2016-08-17','æ˜ŸæœŸä¸‰','ç¼ºå‹¤','ç¼ºå‹¤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15',NULL,'0'),('f6a40952587c45689b3efd2530907f5b','2016-08-22','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('f737b833917c44deb8059ee93d509593','2016-08-08','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('f745bb9c494e408997129bf14ac9520f','2016-08-29','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('f7bdfd5bc9bc45baa2682bee8231ce3c','2016-08-30','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0'),('f7fae2fa46ac490d915593eb30218fd3','2016-08-04','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('f80c904bf5824e4ea7b6c3f7b16ed391','2016-08-25','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('f8ab61e7a50a47d087aa81a53b05b461','2016-08-13','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('f8be5878d782484b9ca557b4429e69b6','2016-08-11','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('f8cc05997c3144088f9f580c1c79a044','2016-08-22','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('f9070aa345714ed8a6979d046f1224fe','2016-08-22','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15',NULL,'0'),('f994a7003e664e2697a7ca7578135b60','2016-08-30','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('fb11dbd7836a4593bcff49e20a82407e','2016-08-29','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('fb392334e4d340198981b572b84d8b28','2016-08-04','æ˜ŸæœŸå››','11:03:06','19:50:28','1','1','2016-08-02 14:07:07','1','2016-08-04 19:50:28',NULL,'0'),('fb4fb409ac574fcb8d1e8f4f6d4cce77','2016-08-18','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('fc096b884aaa44aea07dbc53cd2aa30d','2016-08-06','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('fc8e693b236e47af893eaa3942e618a9','2016-08-22','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('fd125319a8404953a7990a6440970420','2016-08-07','æ˜ŸæœŸæ—¥','ç¼ºå‹¤','ç¼ºå‹¤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('fd4645a66d2244c382ecd33378362507','2016-08-22','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('fd4eb462e2d04b62810be7ac74b1e0fd','2016-08-11','æ˜ŸæœŸå››','ç¼ºå‹¤','ç¼ºå‹¤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('fe0ae148ed0443a0b088fcb4a264b5f0','2016-08-13','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0'),('ff503a9fb8f44f40afc8d695e96cb5ac','2016-08-08','æ˜ŸæœŸä¸€','ç¼ºå‹¤','ç¼ºå‹¤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('ff518862f2dd4c82b3ba85516f3c88e7','2016-08-06','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('ff5e563be66a44b79c2c0245f5cc5fd1','2016-08-23','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('ff61002e069e4a9bb4a4afcc2c0c89fd','2016-08-09','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('ff8eaf4613af4191a32aa89bf0293a0c','2016-08-30','æ˜ŸæœŸäºŒ','ç¼ºå‹¤','ç¼ºå‹¤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('ffc04b0d4f7148bcabaa5b9ed7fbf0d6','2016-08-13','æ˜ŸæœŸå…­','ç¼ºå‹¤','ç¼ºå‹¤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0');
/*!40000 ALTER TABLE `hr_qiandao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_resume`
--

DROP TABLE IF EXISTS `hr_resume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_resume` (
  `id` varchar(200) NOT NULL COMMENT 'ç”¨æˆ·çš„æ ‡è¯†ï¼Œå¯¹å½“å‰å…¬ä¼—å·å”¯ä¸€',
  `name` varchar(20) NOT NULL COMMENT 'å§“å',
  `gender` int(11) DEFAULT '0' COMMENT 'æ€§åˆ«',
  `headimgurl` varchar(200) DEFAULT NULL COMMENT 'ä¸ªäººå¤´åƒ',
  `birthday` varchar(60) DEFAULT NULL COMMENT 'å‡ºç”Ÿæ—¥æœŸ',
  `work_year` varchar(20) DEFAULT NULL COMMENT 'å·¥ä½œå¹´é™',
  `card_type` int(11) DEFAULT NULL COMMENT 'è¯ä»¶ç±»å‹',
  `idnumber` varchar(25) NOT NULL COMMENT 'è¯ä»¶å·',
  `location` varchar(150) DEFAULT NULL COMMENT 'å±…ä½åœ°',
  `email` varchar(80) DEFAULT NULL COMMENT 'email',
  `salary` varchar(200) DEFAULT NULL COMMENT 'ç›®å‰å¹´è–ª',
  `current_situation` varchar(200) DEFAULT NULL COMMENT 'æ±‚èŒçŠ¶æ€',
  `mobile` varchar(20) DEFAULT NULL COMMENT 'æ‰‹æœºå·ç ',
  `hukou` varchar(150) DEFAULT NULL COMMENT 'æˆ·å£',
  `resumekey` char(12) DEFAULT NULL COMMENT 'å…³é”®å­—',
  `stature` varchar(200) DEFAULT NULL COMMENT 'èº«é«˜',
  `marrige` varchar(200) DEFAULT NULL COMMENT 'å©šå§»çŠ¶å†µ',
  `qq_talk` varchar(20) DEFAULT NULL COMMENT 'qqå·',
  `zip_code` char(6) DEFAULT NULL COMMENT 'é‚®ç¼–',
  `ali_talk` varchar(100) DEFAULT NULL COMMENT 'æ—ºæ—ºid',
  `home_page` varchar(200) DEFAULT NULL COMMENT 'ä¸ªäººä¸»é¡µ',
  `address` varchar(150) DEFAULT NULL COMMENT 'åœ°å€',
  `student_group` varchar(200) DEFAULT NULL COMMENT 'å·¥ä½œç»éªŒ',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT 'çŠ¶æ€',
  `office_id` varchar(64) DEFAULT NULL,
  `channel` varchar(20) DEFAULT NULL,
  `open_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_resume`
--

LOCK TABLES `hr_resume` WRITE;
/*!40000 ALTER TABLE `hr_resume` DISABLE KEYS */;
INSERT INTO `hr_resume` VALUES ('69019c90a7cf46149e7db9450d2ee139','èµµä¿Šé¹',1,'','2016-08-04','',0,'230302198402175333','','','','','13552471077','','','','','','','','','','','1','8dc8c943e1bd4c468c34308e9ce6a7eb','WECHAT','null'),('7058770539434fc6ae5e432cbd9d6e88','èµµä¿Šé£',1,'/userfiles/head/a50db4ded81a49a683597d490ace2f84.','2016-08-04 16:50:34','',0,'230302198402175312','','','','','18801029695','','','','','','','','','','','1','8dc8c943e1bd4c468c34308e9ce6a7eb','WEB',NULL),('d56eb0c370444679866e717967b3e016','æç‡•é’',1,'','2016-08-01','',0,'230302198402175301','','','','','18801029601','','','','','','','','','','','1','8dc8c943e1bd4c468c34308e9ce6a7eb','WECHAT',NULL);
/*!40000 ALTER TABLE `hr_resume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_leave`
--

DROP TABLE IF EXISTS `oa_leave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_leave` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `process_instance_id` varchar(64) DEFAULT NULL COMMENT 'æµç¨‹å®ä¾‹ç¼–å·',
  `start_time` datetime DEFAULT NULL COMMENT 'å¼€å§‹æ—¶é—´',
  `end_time` datetime DEFAULT NULL COMMENT 'ç»“æŸæ—¶é—´',
  `leave_type` varchar(20) DEFAULT NULL COMMENT 'è¯·å‡ç±»å‹',
  `reason` varchar(255) DEFAULT NULL COMMENT 'è¯·å‡ç†ç”±',
  `apply_time` datetime DEFAULT NULL COMMENT 'ç”³è¯·æ—¶é—´',
  `reality_start_time` datetime DEFAULT NULL COMMENT 'å®é™…å¼€å§‹æ—¶é—´',
  `reality_end_time` datetime DEFAULT NULL COMMENT 'å®é™…ç»“æŸæ—¶é—´',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `oa_leave_create_by` (`create_by`),
  KEY `oa_leave_process_instance_id` (`process_instance_id`),
  KEY `oa_leave_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='è¯·å‡æµç¨‹è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_leave`
--

LOCK TABLES `oa_leave` WRITE;
/*!40000 ALTER TABLE `oa_leave` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_leave` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_notify`
--

DROP TABLE IF EXISTS `oa_notify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_notify` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `type` char(1) DEFAULT NULL COMMENT 'ç±»å‹',
  `title` varchar(200) DEFAULT NULL COMMENT 'æ ‡é¢˜',
  `content` varchar(2000) DEFAULT NULL COMMENT 'å†…å®¹',
  `files` varchar(2000) DEFAULT NULL COMMENT 'é™„ä»¶',
  `status` char(1) DEFAULT NULL COMMENT 'çŠ¶æ€',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `oa_notify_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='é€šçŸ¥é€šå‘Š';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_notify`
--

LOCK TABLES `oa_notify` WRITE;
/*!40000 ALTER TABLE `oa_notify` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_notify` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_notify_record`
--

DROP TABLE IF EXISTS `oa_notify_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_notify_record` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `oa_notify_id` varchar(64) DEFAULT NULL COMMENT 'é€šçŸ¥é€šå‘ŠID',
  `user_id` varchar(64) DEFAULT NULL COMMENT 'æ¥å—äºº',
  `read_flag` char(1) DEFAULT '0' COMMENT 'é˜…è¯»æ ‡è®°',
  `read_date` date DEFAULT NULL COMMENT 'é˜…è¯»æ—¶é—´',
  PRIMARY KEY (`id`),
  KEY `oa_notify_record_notify_id` (`oa_notify_id`),
  KEY `oa_notify_record_user_id` (`user_id`),
  KEY `oa_notify_record_read_flag` (`read_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='é€šçŸ¥é€šå‘Šå‘é€è®°å½•';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_notify_record`
--

LOCK TABLES `oa_notify_record` WRITE;
/*!40000 ALTER TABLE `oa_notify_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_notify_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_test_audit`
--

DROP TABLE IF EXISTS `oa_test_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_test_audit` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `PROC_INS_ID` varchar(64) DEFAULT NULL COMMENT 'æµç¨‹å®ä¾‹ID',
  `USER_ID` varchar(64) DEFAULT NULL COMMENT 'å˜åŠ¨ç”¨æˆ·',
  `OFFICE_ID` varchar(64) DEFAULT NULL COMMENT 'å½’å±éƒ¨é—¨',
  `POST` varchar(255) DEFAULT NULL COMMENT 'å²—ä½',
  `AGE` char(1) DEFAULT NULL COMMENT 'æ€§åˆ«',
  `EDU` varchar(255) DEFAULT NULL COMMENT 'å­¦å†',
  `CONTENT` varchar(255) DEFAULT NULL COMMENT 'è°ƒæ•´åŸå› ',
  `OLDA` varchar(255) DEFAULT NULL COMMENT 'ç°è¡Œæ ‡å‡† è–ªé…¬æ¡£çº§',
  `OLDB` varchar(255) DEFAULT NULL COMMENT 'ç°è¡Œæ ‡å‡† æœˆå·¥èµ„é¢',
  `OLDC` varchar(255) DEFAULT NULL COMMENT 'ç°è¡Œæ ‡å‡† å¹´è–ªæ€»é¢',
  `NEWA` varchar(255) DEFAULT NULL COMMENT 'è°ƒæ•´åæ ‡å‡† è–ªé…¬æ¡£çº§',
  `NEWB` varchar(255) DEFAULT NULL COMMENT 'è°ƒæ•´åæ ‡å‡† æœˆå·¥èµ„é¢',
  `NEWC` varchar(255) DEFAULT NULL COMMENT 'è°ƒæ•´åæ ‡å‡† å¹´è–ªæ€»é¢',
  `ADD_NUM` varchar(255) DEFAULT NULL COMMENT 'æœˆå¢èµ„',
  `EXE_DATE` varchar(255) DEFAULT NULL COMMENT 'æ‰§è¡Œæ—¶é—´',
  `HR_TEXT` varchar(255) DEFAULT NULL COMMENT 'äººåŠ›èµ„æºéƒ¨é—¨æ„è§',
  `LEAD_TEXT` varchar(255) DEFAULT NULL COMMENT 'åˆ†ç®¡é¢†å¯¼æ„è§',
  `MAIN_LEAD_TEXT` varchar(255) DEFAULT NULL COMMENT 'é›†å›¢ä¸»è¦é¢†å¯¼æ„è§',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `OA_TEST_AUDIT_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='å®¡æ‰¹æµç¨‹æµ‹è¯•è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oa_test_audit`
--

LOCK TABLES `oa_test_audit` WRITE;
/*!40000 ALTER TABLE `oa_test_audit` DISABLE KEYS */;
/*!40000 ALTER TABLE `oa_test_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sequence`
--

DROP TABLE IF EXISTS `sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequence` (
  `seq_type` varchar(20) NOT NULL,
  `seq_no` bigint(20) NOT NULL,
  `seq_length` tinyint(2) NOT NULL,
  PRIMARY KEY (`seq_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sequence`
--

LOCK TABLES `sequence` WRITE;
/*!40000 ALTER TABLE `sequence` DISABLE KEYS */;
INSERT INTO `sequence` VALUES ('accountNo',10000000,8),('clearNo',1000000000,10),('serialNo',100000000014,12);
/*!40000 ALTER TABLE `sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_area`
--

DROP TABLE IF EXISTS `sys_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_area` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `parent_id` varchar(64) NOT NULL COMMENT 'çˆ¶çº§ç¼–å·',
  `parent_ids` varchar(2000) NOT NULL COMMENT 'æ‰€æœ‰çˆ¶çº§ç¼–å·',
  `name` varchar(100) NOT NULL COMMENT 'åç§°',
  `sort` decimal(10,0) NOT NULL COMMENT 'æ’åº',
  `code` varchar(100) DEFAULT NULL COMMENT 'åŒºåŸŸç¼–ç ',
  `type` char(1) DEFAULT NULL COMMENT 'åŒºåŸŸç±»å‹',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `sys_area_parent_id` (`parent_id`),
  KEY `sys_area_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='åŒºåŸŸè¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_area`
--

LOCK TABLES `sys_area` WRITE;
/*!40000 ALTER TABLE `sys_area` DISABLE KEYS */;
INSERT INTO `sys_area` VALUES ('1','0','0,','ä¸­å›½',10,'100000','1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','1','0,1,','åŒ—äº¬å¸‚',20,'110000','2','1','2013-05-27 08:00:00','1','2016-08-02 10:25:11','','0'),('3','2','0,1,2,','æµå—å¸‚',30,'110101','3','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('4','3','0,1,2,3,','å†åŸåŒº',40,'110102','4','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('5','3','0,1,2,3,','å†ä¸‹åŒº',50,'110104','4','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('6','3','0,1,2,3,','é«˜æ–°åŒº',60,'110105','4','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1');
/*!40000 ALTER TABLE `sys_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict`
--

DROP TABLE IF EXISTS `sys_dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `value` varchar(100) NOT NULL COMMENT 'æ•°æ®å€¼',
  `label` varchar(100) NOT NULL COMMENT 'æ ‡ç­¾å',
  `type` varchar(100) NOT NULL COMMENT 'ç±»å‹',
  `description` varchar(100) NOT NULL COMMENT 'æè¿°',
  `sort` decimal(10,0) NOT NULL COMMENT 'æ’åºï¼ˆå‡åºï¼‰',
  `parent_id` varchar(64) DEFAULT '0' COMMENT 'çˆ¶çº§ç¼–å·',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`label`),
  KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='å­—å…¸è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict`
--

LOCK TABLES `sys_dict` WRITE;
/*!40000 ALTER TABLE `sys_dict` DISABLE KEYS */;
INSERT INTO `sys_dict` VALUES ('1','0','æ­£å¸¸','del_flag','åˆ é™¤æ ‡è®°',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('10','yellow','é»„è‰²','color','é¢œè‰²å€¼',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('101','com.thinkgem.jeesite.modules.sys.entity.User','User','gen_java_type','Javaç±»å‹\0\0',60,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('102','com.thinkgem.jeesite.modules.sys.entity.Office','Office','gen_java_type','Javaç±»å‹\0\0',70,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('103','com.thinkgem.jeesite.modules.sys.entity.Area','Area','gen_java_type','Javaç±»å‹\0\0',80,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('104','Custom','Custom','gen_java_type','Javaç±»å‹\0\0',90,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('105','1','ä¼šè®®é€šå‘Š\0\0\0\0','oa_notify_type','é€šçŸ¥é€šå‘Šç±»å‹',10,'0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('106','2','å¥–æƒ©é€šå‘Š\0\0\0\0','oa_notify_type','é€šçŸ¥é€šå‘Šç±»å‹',20,'0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('107','3','æ´»åŠ¨é€šå‘Š\0\0\0\0','oa_notify_type','é€šçŸ¥é€šå‘Šç±»å‹',30,'0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('108','0','è‰ç¨¿','oa_notify_status','é€šçŸ¥é€šå‘ŠçŠ¶æ€',10,'0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('109','1','å‘å¸ƒ','oa_notify_status','é€šçŸ¥é€šå‘ŠçŠ¶æ€',20,'0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('11','orange','æ©™è‰²','color','é¢œè‰²å€¼',50,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('110','0','æœªè¯»','oa_notify_read','é€šçŸ¥é€šå‘ŠçŠ¶æ€',10,'0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('111','1','å·²è¯»','oa_notify_read','é€šçŸ¥é€šå‘ŠçŠ¶æ€',20,'0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('12','default','é»˜è®¤ä¸»é¢˜','theme','ä¸»é¢˜æ–¹æ¡ˆ',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('13','cerulean','å¤©è“ä¸»é¢˜','theme','ä¸»é¢˜æ–¹æ¡ˆ',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('14','readable','æ©™è‰²ä¸»é¢˜','theme','ä¸»é¢˜æ–¹æ¡ˆ',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('15','united','çº¢è‰²ä¸»é¢˜','theme','ä¸»é¢˜æ–¹æ¡ˆ',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('16','flat','Flatä¸»é¢˜','theme','ä¸»é¢˜æ–¹æ¡ˆ',60,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('17','1','å›½å®¶','sys_area_type','åŒºåŸŸç±»å‹',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('18','2','çœä»½ã€ç›´è¾–å¸‚','sys_area_type','åŒºåŸŸç±»å‹',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('19','3','åœ°å¸‚','sys_area_type','åŒºåŸŸç±»å‹',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','1','åˆ é™¤','del_flag','åˆ é™¤æ ‡è®°',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('20','4','åŒºå¿','sys_area_type','åŒºåŸŸç±»å‹',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('200','0','èº«ä»½è¯','card_type','è¯ä»¶ç±»å‹',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('201','1','å±…ä½è¯','card_type','è¯ä»¶ç±»å‹',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('202','2','ç­¾è¯','card_type','è¯ä»¶ç±»å‹',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('203','3','æŠ¤ç…§','card_type','è¯ä»¶ç±»å‹',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('204','4','æˆ·å£æœ¬','card_type','è¯ä»¶ç±»å‹',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('205','5','å†›äººè¯','card_type','è¯ä»¶ç±»å‹',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('206','6','å›¢å‘˜è¯','card_type','è¯ä»¶ç±»å‹',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('207','7','å…šå‘˜è¯','card_type','è¯ä»¶ç±»å‹',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('208','8','æ¸¯æ¾³é€šè¡Œè¯','card_type','è¯ä»¶ç±»å‹',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('21','1','å…¬å¸','sys_office_type','æœºæ„ç±»å‹',60,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('22','2','éƒ¨é—¨','sys_office_type','æœºæ„ç±»å‹',70,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('23','3','å°ç»„','sys_office_type','æœºæ„ç±»å‹',80,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('24','4','å…¶å®ƒ','sys_office_type','æœºæ„ç±»å‹',90,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('25','1','ç»¼åˆéƒ¨','sys_office_common','å¿«æ·é€šç”¨éƒ¨é—¨',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('26','2','å¼€å‘éƒ¨','sys_office_common','å¿«æ·é€šç”¨éƒ¨é—¨',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('27','3','äººåŠ›éƒ¨','sys_office_common','å¿«æ·é€šç”¨éƒ¨é—¨',50,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('28','1','ä¸€çº§','sys_office_grade','æœºæ„ç­‰çº§',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('29','2','äºŒçº§','sys_office_grade','æœºæ„ç­‰çº§',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','1','æ˜¾ç¤º','show_hide','æ˜¾ç¤º/éšè—',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('30','3','ä¸‰çº§','sys_office_grade','æœºæ„ç­‰çº§',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('31','4','å››çº§','sys_office_grade','æœºæ„ç­‰çº§',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('32','1','æ‰€æœ‰æ•°æ®','sys_data_scope','æ•°æ®èŒƒå›´',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('33','2','æ‰€åœ¨å…¬å¸åŠä»¥ä¸‹æ•°æ®','sys_data_scope','æ•°æ®èŒƒå›´',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('34','3','æ‰€åœ¨å…¬å¸æ•°æ®','sys_data_scope','æ•°æ®èŒƒå›´',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('35','4','æ‰€åœ¨éƒ¨é—¨åŠä»¥ä¸‹æ•°æ®','sys_data_scope','æ•°æ®èŒƒå›´',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('36','5','æ‰€åœ¨éƒ¨é—¨æ•°æ®','sys_data_scope','æ•°æ®èŒƒå›´',50,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('37','8','ä»…æœ¬äººæ•°æ®','sys_data_scope','æ•°æ®èŒƒå›´',90,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('38','9','æŒ‰æ˜ç»†è®¾ç½®','sys_data_scope','æ•°æ®èŒƒå›´',100,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('39','1','ç³»ç»Ÿç®¡ç†','sys_user_type','ç”¨æˆ·ç±»å‹',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4','0','éšè—','show_hide','æ˜¾ç¤º/éšè—',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('40','2','éƒ¨é—¨ç»ç†','sys_user_type','ç”¨æˆ·ç±»å‹',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('41','3','æ™®é€šç”¨æˆ·','sys_user_type','ç”¨æˆ·ç±»å‹',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('42','basic','åŸºç¡€ä¸»é¢˜','cms_theme','ç«™ç‚¹ä¸»é¢˜',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('43','blue','è“è‰²ä¸»é¢˜','cms_theme','ç«™ç‚¹ä¸»é¢˜',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('44','red','çº¢è‰²ä¸»é¢˜','cms_theme','ç«™ç‚¹ä¸»é¢˜',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('45','article','æ–‡ç« æ¨¡å‹','cms_module','æ ç›®æ¨¡å‹',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('46','picture','å›¾ç‰‡æ¨¡å‹','cms_module','æ ç›®æ¨¡å‹',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('47','download','ä¸‹è½½æ¨¡å‹','cms_module','æ ç›®æ¨¡å‹',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('48','link','é“¾æ¥æ¨¡å‹','cms_module','æ ç›®æ¨¡å‹',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('49','special','ä¸“é¢˜æ¨¡å‹','cms_module','æ ç›®æ¨¡å‹',50,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('5','1','æ˜¯','yes_no','æ˜¯/å¦',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('50','0','é»˜è®¤å±•ç°æ–¹å¼','cms_show_modes','å±•ç°æ–¹å¼',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('51','1','é¦–æ ç›®å†…å®¹åˆ—è¡¨','cms_show_modes','å±•ç°æ–¹å¼',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('52','2','æ ç›®ç¬¬ä¸€æ¡å†…å®¹','cms_show_modes','å±•ç°æ–¹å¼',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('53','0','å‘å¸ƒ','cms_del_flag','å†…å®¹çŠ¶æ€',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('54','1','åˆ é™¤','cms_del_flag','å†…å®¹çŠ¶æ€',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('55','2','å®¡æ ¸','cms_del_flag','å†…å®¹çŠ¶æ€',15,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('56','1','é¦–é¡µç„¦ç‚¹å›¾','cms_posid','æ¨èä½',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('57','2','æ ç›®é¡µæ–‡ç« æ¨è','cms_posid','æ¨èä½',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('58','1','å’¨è¯¢','cms_guestbook','ç•™è¨€æ¿åˆ†ç±»',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('59','2','å»ºè®®','cms_guestbook','ç•™è¨€æ¿åˆ†ç±»',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6','0','å¦','yes_no','æ˜¯/å¦',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('60','3','æŠ•è¯‰','cms_guestbook','ç•™è¨€æ¿åˆ†ç±»',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('61','4','å…¶å®ƒ','cms_guestbook','ç•™è¨€æ¿åˆ†ç±»',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('62','1','å…¬ä¼‘','oa_leave_type','è¯·å‡ç±»å‹',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('63','2','ç—…å‡','oa_leave_type','è¯·å‡ç±»å‹',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('64','3','äº‹å‡','oa_leave_type','è¯·å‡ç±»å‹',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('65','4','è°ƒä¼‘','oa_leave_type','è¯·å‡ç±»å‹',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('66','5','å©šå‡','oa_leave_type','è¯·å‡ç±»å‹',60,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('67','1','æ¥å…¥æ—¥å¿—','sys_log_type','æ—¥å¿—ç±»å‹',30,'0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('68','2','å¼‚å¸¸æ—¥å¿—','sys_log_type','æ—¥å¿—ç±»å‹',40,'0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('69','leave','è¯·å‡æµç¨‹','act_type','æµç¨‹ç±»å‹',10,'0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('7','red','çº¢è‰²','color','é¢œè‰²å€¼',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('70','test_audit','å®¡æ‰¹æµ‹è¯•æµç¨‹','act_type','æµç¨‹ç±»å‹',20,'0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('71','1','åˆ†ç±»1','act_category','æµç¨‹åˆ†ç±»',10,'0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('72','2','åˆ†ç±»2','act_category','æµç¨‹åˆ†ç±»',20,'0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('73','crud','å¢åˆ æ”¹æŸ¥','gen_category','ä»£ç ç”Ÿæˆåˆ†ç±»',10,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('74','crud_many','å¢åˆ æ”¹æŸ¥ï¼ˆåŒ…å«ä»è¡¨ï¼‰','gen_category','ä»£ç ç”Ÿæˆåˆ†ç±»',20,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('75','tree','æ ‘ç»“æ„','gen_category','ä»£ç ç”Ÿæˆåˆ†ç±»',30,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('76','=','=','gen_query_type','æŸ¥è¯¢æ–¹å¼',10,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('77','!=','!=','gen_query_type','æŸ¥è¯¢æ–¹å¼',20,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('78','&gt;','&gt;','gen_query_type','æŸ¥è¯¢æ–¹å¼',30,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('79','&lt;','&lt;','gen_query_type','æŸ¥è¯¢æ–¹å¼',40,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('8','green','ç»¿è‰²','color','é¢œè‰²å€¼',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('80','between','Between','gen_query_type','æŸ¥è¯¢æ–¹å¼',50,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('81','like','Like','gen_query_type','æŸ¥è¯¢æ–¹å¼',60,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('82','left_like','Left Like','gen_query_type','æŸ¥è¯¢æ–¹å¼',70,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('83','right_like','Right Like','gen_query_type','æŸ¥è¯¢æ–¹å¼',80,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('84','input','æ–‡æœ¬æ¡†','gen_show_type','å­—æ®µç”Ÿæˆæ–¹æ¡ˆ',10,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('85','textarea','æ–‡æœ¬åŸŸ','gen_show_type','å­—æ®µç”Ÿæˆæ–¹æ¡ˆ',20,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('86','select','ä¸‹æ‹‰æ¡†','gen_show_type','å­—æ®µç”Ÿæˆæ–¹æ¡ˆ',30,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('87','checkbox','å¤é€‰æ¡†','gen_show_type','å­—æ®µç”Ÿæˆæ–¹æ¡ˆ',40,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('88','radiobox','å•é€‰æ¡†','gen_show_type','å­—æ®µç”Ÿæˆæ–¹æ¡ˆ',50,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('89','dateselect','æ—¥æœŸé€‰æ‹©','gen_show_type','å­—æ®µç”Ÿæˆæ–¹æ¡ˆ',60,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('9','blue','è“è‰²','color','é¢œè‰²å€¼',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('90','userselect','äººå‘˜é€‰æ‹©\0','gen_show_type','å­—æ®µç”Ÿæˆæ–¹æ¡ˆ',70,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('91','officeselect','éƒ¨é—¨é€‰æ‹©','gen_show_type','å­—æ®µç”Ÿæˆæ–¹æ¡ˆ',80,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('92','areaselect','åŒºåŸŸé€‰æ‹©','gen_show_type','å­—æ®µç”Ÿæˆæ–¹æ¡ˆ',90,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('93','String','String','gen_java_type','Javaç±»å‹',10,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('94','Long','Long','gen_java_type','Javaç±»å‹',20,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('95','dao','ä»…æŒä¹…å±‚','gen_category','ä»£ç ç”Ÿæˆåˆ†ç±»\0\0\0\0\0\0',40,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('96','1','ç”·','sex','æ€§åˆ«',10,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'0'),('97','2','å¥³','sex','æ€§åˆ«',20,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'0'),('98','Integer','Integer','gen_java_type','Javaç±»å‹\0\0',30,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('99','Double','Double','gen_java_type','Javaç±»å‹\0\0',40,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1');
/*!40000 ALTER TABLE `sys_dict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_log`
--

DROP TABLE IF EXISTS `sys_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_log` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `type` char(1) DEFAULT '1' COMMENT 'æ—¥å¿—ç±»å‹',
  `title` varchar(255) DEFAULT '' COMMENT 'æ—¥å¿—æ ‡é¢˜',
  `create_by` varchar(64) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `remote_addr` varchar(255) DEFAULT NULL COMMENT 'æ“ä½œIPåœ°å€',
  `user_agent` varchar(255) DEFAULT NULL COMMENT 'ç”¨æˆ·ä»£ç†',
  `request_uri` varchar(255) DEFAULT NULL COMMENT 'è¯·æ±‚URI',
  `method` varchar(5) DEFAULT NULL COMMENT 'æ“ä½œæ–¹å¼',
  `params` text COMMENT 'æ“ä½œæäº¤çš„æ•°æ®',
  `exception` text COMMENT 'å¼‚å¸¸ä¿¡æ¯',
  PRIMARY KEY (`id`),
  KEY `sys_log_create_by` (`create_by`),
  KEY `sys_log_request_uri` (`request_uri`),
  KEY `sys_log_type` (`type`),
  KEY `sys_log_create_date` (`create_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æ—¥å¿—è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log`
--

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
INSERT INTO `sys_log` VALUES ('026487abdc5249c5a396bd3d71e3e3c2','1','å†…å®¹ç®¡ç†-æ ç›®è®¾ç½®-åˆ‡æ¢ç«™ç‚¹','1','2016-08-04 15:57:21','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/site/select','GET','',''),('03c439cdf9234b7288cd8b16239872f8','1','ä»£ç ç”Ÿæˆ-ä»£ç ç”Ÿæˆ-ä¸šåŠ¡è¡¨é…ç½®','1','2016-08-04 16:55:45','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/gen/genTable','GET','',''),('05b2f16f55f742d5bc55e0fd133f66eb','1','ç³»ç»Ÿè®¾ç½®-æœºæ„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†','1','2016-08-04 16:53:29','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/index','GET','',''),('0740460b32654b41a38ac97e8fdcda83','1','ä»£ç ç”Ÿæˆ-ä»£ç ç”Ÿæˆ-ä¸šåŠ¡è¡¨é…ç½®','1','2016-08-04 15:56:57','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/gen/genTable','GET','',''),('08547b92f0b94df0accc2fff7ab92113','1','å†…å®¹ç®¡ç†-æ ç›®è®¾ç½®-æ ç›®ç®¡ç†-æŸ¥çœ‹','1','2016-08-04 19:54:11','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/category/form','GET','id=2',''),('08cee9ffd17a40679c7d370b40575b1e','1','ç³»ç»Ÿç™»å½•','791290e1344945a993748b7df9a2b628','2016-08-04 16:25:00','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a','GET','login=',''),('0be40114c7ce4500b5a186fc8b99c7b6','1','æˆ‘çš„é¢æ¿-ä¸ªäººä¿¡æ¯-ä¸ªäººä¿¡æ¯','1','2016-08-04 15:56:53','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','',''),('1006fe7695974b8c9fdad22396daa07f','1','æˆ‘çš„é¢æ¿-ä¸ªäººä¿¡æ¯-ä¸ªäººä¿¡æ¯','5cbc0c90dca846b88ab0b8a547006df2','2016-08-04 17:15:02','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','',''),('10e528730c1847af864445d70aa46531','1','æˆ‘çš„é¢æ¿-ä¸ªäººä¿¡æ¯-ä¸ªäººä¿¡æ¯','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:09','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','',''),('112e5018c898425e8fc8c76e3fa0d912','1','ç³»ç»Ÿè®¾ç½®-æœºæ„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†-æŸ¥çœ‹','1','2016-08-04 19:42:05','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/list','GET','',''),('1169cb8525ea4b67a6a6addb32e80ea5','1','å†…å®¹ç®¡ç†-æ ç›®è®¾ç½®-æ ç›®ç®¡ç†','1','2016-08-04 19:54:16','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/category/','GET','',''),('11c29d473d0e48d386f28f08ba0e5110','1','ç³»ç»Ÿç™»å½•','791290e1344945a993748b7df9a2b628','2016-08-04 16:51:19','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a','GET','login=',''),('149ff1b72c9543e39c1a799a66331352','1','ç³»ç»Ÿè®¾ç½®-ç³»ç»Ÿè®¾ç½®-èœå•ç®¡ç†-æŸ¥çœ‹','1','2016-08-04 17:07:28','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/menu/form','GET','id=bac620c272f84f0988bde3c093c5e9f1',''),('163c711c0f9e425e969794c4b3b10296','1','æˆ‘çš„é¢æ¿-ä¸ªäººä¿¡æ¯-ä¸ªäººä¿¡æ¯','791290e1344945a993748b7df9a2b628','2016-08-04 19:37:28','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','',''),('17c6c918cb6f47e7aec26341b6859faf','1','ç³»ç»Ÿç™»å½•','7cfec60bc9c947f284bff8a0247fb500','2016-08-04 19:39:40','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a','GET','login=',''),('187351b302144fc19d1120a0cd1e6e86','1','æˆ‘çš„é¢æ¿-ä¸ªäººä¿¡æ¯-ä¸ªäººä¿¡æ¯','7cfec60bc9c947f284bff8a0247fb500','2016-08-04 19:39:41','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','',''),('194bc3df32cd44d19dfb5c9493b85fed','1','ç³»ç»Ÿç™»å½•','1','2016-08-04 17:09:27','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a','GET','login=',''),('1a8c46ea903d45b695c247db47a19c4d','1','æˆ‘çš„é¢æ¿-ä¸ªäººä¿¡æ¯-æˆ‘çš„ç­¾åˆ°','7cfec60bc9c947f284bff8a0247fb500','2016-08-04 19:39:43','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/qiandao/qiandao/list','GET','',''),('1b526e618f98451c96a9cedc091acbd4','1','ç³»ç»Ÿè®¾ç½®-ç³»ç»Ÿè®¾ç½®-èœå•ç®¡ç†','1','2016-08-04 19:50:38','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/menu/','GET','',''),('1b9bdc4e875d4f478d79573eb0d2311f','1','å†…å®¹ç®¡ç†-å†…å®¹ç®¡ç†-è¯„è®ºç®¡ç†-æŸ¥çœ‹','1','2016-08-04 15:57:09','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/comment/','GET','status=2',''),('1c5e28da5a054bdcbd99b3caa2e7d776','1','ç³»ç»Ÿè®¾ç½®-æœºæ„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†','1','2016-08-04 19:50:32','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/index','GET','',''),('1c8e6f8eb17e4601a898eb15d9e1a87d','1','ç³»ç»Ÿè®¾ç½®-æœºæ„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†-ä¿®æ”¹','1','2016-08-04 16:52:22','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/checkLoginName','GET','oldLoginName=&loginName=gaiyuyan',''),('1e670cae9e2048fa92c80f187b05ffaf','1','ç³»ç»Ÿè®¾ç½®-ç³»ç»Ÿè®¾ç½®-è§’è‰²ç®¡ç†-ä¿®æ”¹','1','2016-08-04 16:52:04','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/role/save','POST','dataScope=5&officeIds=&remarks=&office.id=2&oldName=æ•™å¸ˆä¸€ç»„&menuIds=1,27,28,29,30,cb2b4da8a7374dc7b530146b0bff5126,71,56,57,58,59,62,88,89,90,31,60,61,2,13,20,21,67,...&id=2338d11290ee4bf0b1e9b0c49786395e&useable=1&office.name=å…¬å¸é¢†å¯¼&name=æ•™å¸ˆä¸€ç»„&roleType=user&sysData=1&enname=teacher1&oldEnname=teacher1',''),('1e95480c00464c4b92e2541caf5ace22','1','æ•°æ®å®¡æ ¸-å­¦å‘˜ä¿¡æ¯-å®¡æ ¸','1','2016-08-04 15:57:01','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/resume/resume/list','GET','',''),('2057f28a43fb4ed6b2570dea5e96ea8b','1','æˆ‘çš„é¢æ¿-ä¸ªäººä¿¡æ¯-ä¸ªäººä¿¡æ¯','1','2016-08-04 16:51:33','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','',''),('21428c0a3d92485da87a63216c1d6300','1','å†…å®¹ç®¡ç†-æ ç›®è®¾ç½®-æ ç›®ç®¡ç†','1','2016-08-04 19:53:57','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/category/','GET','',''),('23182142bd9242bfa75b42008c418f10','1','æˆ‘çš„é¢æ¿-ä¸ªäººä¿¡æ¯-ä¸ªäººä¿¡æ¯','1','2016-08-04 18:34:30','127.0.0.1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','',''),('24845266d5d54c2b8ef843073eb5960b','1','æˆ‘çš„é¢æ¿-ä¸ªäººä¿¡æ¯-ä¸ªäººä¿¡æ¯','1','2016-08-04 16:55:44','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','',''),('249b99f4a1234620937d9a199da4e472','1','ç³»ç»Ÿè®¾ç½®-æ—¥å¿—æŸ¥è¯¢-æ—¥å¿—æŸ¥è¯¢','5cbc0c90dca846b88ab0b8a547006df2','2016-08-04 17:14:42','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/log','GET','',''),('2594f19f5a34470d828b8c781a4f1076','1','ä»£ç ç”Ÿæˆ-ä»£ç ç”Ÿæˆ-ä¸šåŠ¡è¡¨é…ç½®','1','2016-08-04 17:11:16','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/gen/genTable','GET','',''),('25ae2dea587c4cf6ada48acb679dc93f','1','ç³»ç»Ÿç™»å½•','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:09','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a','GET','login=',''),('266109d0b057413d8b71aaddef324fe8','1','ç³»ç»Ÿè®¾ç½®-ç³»ç»Ÿè®¾ç½®-è§’è‰²ç®¡ç†','1','2016-08-04 16:55:58','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/role/','GET','repage=',''),('2680bb0eeefc4686bbe9f914601cb88e','1','æˆ‘çš„é¢æ¿-ä¸ªäººä¿¡æ¯-ä¸ªäººä¿¡æ¯','791290e1344945a993748b7df9a2b628','2016-08-04 16:51:19','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','',''),('26945b49b30c496391202c3e0261cbf2','1','ç³»ç»Ÿè®¾ç½®-ç³»ç»Ÿè®¾ç½®-è§’è‰²ç®¡ç†-æŸ¥çœ‹','1','2016-08-04 16:51:42','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/role/form','GET','id=2338d11290ee4bf0b1e9b0c49786395e',''),('2898e3888c2f459f9c29456627c0b16d','1','å†…å®¹ç®¡ç†-æ ç›®è®¾ç½®-ç«™ç‚¹è®¾ç½®','1','2016-08-04 15:57:20','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/site/','GET','',''),('291bdda446ba46e9b4465deb9017e93e','1','ç³»ç»Ÿè®¾ç½®-ç³»ç»Ÿè®¾ç½®-è§’è‰²ç®¡ç†','1','2016-08-04 19:42:08','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/role/','GET','',''),('293b6a8a400a48c3b8974613c4efe4db','1','æ•°æ®å®¡æ ¸-å­¦å‘˜ä¿¡æ¯-å¾…å®¡æ ¸','1','2016-08-04 17:09:45','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/resume/resume/list','GET','',''),('29b513dee26d4510b9b48a62b624b125','1','ç³»ç»Ÿè®¾ç½®-æœºæ„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†','1','2016-08-04 16:24:00','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/index','GET','',''),('2a5240de1b6842548becaf6a3c962633','1','å†…å®¹ç®¡ç†-æ ç›®è®¾ç½®-æ ç›®ç®¡ç†-ä¿®æ”¹','1','2016-08-04 19:54:25','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/category/save','POST','module=article&keywords=&sort=20&isAudit=0&inList=1&customContentView=&inMenu=1&image=&office.id=4&id=10&customListView=&office.name=å¸‚åœºéƒ¨&description=&parent.id=1&name=æ•°æ®åº“&target=&allowComment=1&showModes=0&href=&viewConfig=&parent.name=é¡¶çº§æ ç›®',''),('2b4c57237d224d64a89df7c8d773aa74','1','ç³»ç»Ÿè®¾ç½®-ç³»ç»Ÿè®¾ç½®-è§’è‰²ç®¡ç†-ä¿®æ”¹','1','2016-08-04 16:53:25','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/role/save','POST','dataScope=4&officeIds=&remarks=&office.id=bec64ac0838c400fb54d9ca823435a75&oldName=&id=&menuIds=1,27,28,29,30,cb2b4da8a7374dc7b530146b0bff5126,71,56,57,58,59,62,88,89,90,31,40,53,54,55,60,61,2,...&useable=1&office.name=äºŒç»„&name=æ•™å¸ˆäºŒç»„&roleType=assignment&oldEnname=&enname=teacher2&sysData=1',''),('2ca7d3ff910b4a7bb36301a993ebc3b0','1','ç³»ç»Ÿè®¾ç½®-æœºæ„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†-æŸ¥çœ‹','1','2016-08-04 16:52:09','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/form','GET','',''),('2d4893e89f454318ae52aafb93eee0c4','1','ç³»ç»Ÿè®¾ç½®-ç³»ç»Ÿè®¾ç½®-è§’è‰²ç®¡ç†-æŸ¥çœ‹','1','2016-08-04 19:42:11','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/role/form','GET','id=2338d11290ee4bf0b1e9b0c49786395e',''),('2dfd7def2089427ab327c1bc4cb83931','1','ç³»ç»Ÿè®¾ç½®-æœºæ„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†-æŸ¥çœ‹','1','2016-08-04 16:53:30','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/form','GET','',''),('2f68e6af76c4441eb657afbc84aae5f0','1','å†…å®¹ç®¡ç†-æ ç›®è®¾ç½®-æ ç›®ç®¡ç†','1','2016-08-04 19:52:36','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/category/','GET','',''),('3166c1602b164eeeaf8097e69cf517fe','1','æˆ‘çš„é¢æ¿-ä¸ªäººä¿¡æ¯-ä¸ªäººä¿¡æ¯','7cfec60bc9c947f284bff8a0247fb500','2016-08-04 19:40:40','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','',''),('3188057188284ee3a506eecadd2708d4','1','ç³»ç»Ÿè®¾ç½®-ç³»ç»Ÿè®¾ç½®-è§’è‰²ç®¡ç†-æŸ¥çœ‹','1','2016-08-04 16:52:32','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/role/form','GET','',''),('3383e54587444cc2b0ee875f50c58fe3','1','å†…å®¹ç®¡ç†-æ ç›®è®¾ç½®-æ ç›®ç®¡ç†-ä¿®æ”¹','1','2016-08-04 19:54:41','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/category/save','POST','module=article&keywords=&sort=20&isAudit=0&inList=1&customContentView=&inMenu=1&image=&office.id=3&id=6&customListView=&office.name=ç»¼åˆéƒ¨&description=&parent.id=1&name=jquery&target=&allowComment=1&showModes=1&href=&viewConfig=&parent.name=é¡¶çº§æ ç›®',''),('3415790ffda2439192d89a371b733d00','1','æˆ‘çš„é¢æ¿-ä¸ªäººä¿¡æ¯-ä¸ªäººä¿¡æ¯','7cfec60bc9c947f284bff8a0247fb500','2016-08-04 19:40:35','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','',''),('34e8ddb9cf9d447e981395a01821100c','1','ç³»ç»Ÿè®¾ç½®-æœºæ„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†-æŸ¥çœ‹','1','2016-08-04 16:24:47','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/list','GET','repage=',''),('34eb9ec0f8d7484b93401597eaf08f28','1','æ•°æ®å®¡æ ¸-å­¦å‘˜ä¿¡æ¯-å¾…å®¡æ ¸','1','2016-08-04 17:13:36','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/resume/resume/list','GET','',''),('359d81ede8514e2bae00d49858f29b74','1','æˆ‘çš„é¢æ¿-ä¸ªäººä¿¡æ¯-æˆ‘çš„ç­¾åˆ°','1','2016-08-04 19:10:10','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/qiandao/qiandao/list','GET','',''),('3761b12437674313aaefc0aaa203d3cf','1','å†…å®¹ç®¡ç†-æ ç›®è®¾ç½®-æ ç›®ç®¡ç†-ä¿®æ”¹','1','2016-08-04 19:54:07','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/category/delete','GET','id=7',''),('39a11da0f6994c56b7509a06dcb2dbbc','1','å†…å®¹ç®¡ç†-æ ç›®è®¾ç½®-æ ç›®ç®¡ç†','1','2016-08-04 19:54:42','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/category/','GET','',''),('3b4ee68eb17e4bed82f4fd8744bd837b','1','ç³»ç»Ÿè®¾ç½®-ç³»ç»Ÿè®¾ç½®-è§’è‰²ç®¡ç†','1','2016-08-04 16:53:25','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/role/','GET','repage=',''),('3b9bd956c4964b52be935ab422bba585','1','ç³»ç»Ÿè®¾ç½®-æœºæ„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†-ä¿®æ”¹','1','2016-08-04 16:24:29','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/checkLoginName','GET','oldLoginName=&loginName=1',''),('3c586f964dcd4162b75f0764a1d519d5','1','æˆ‘çš„é¢æ¿-ä¸ªäººä¿¡æ¯-æˆ‘çš„ç­¾åˆ°','1','2016-08-04 18:47:55','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/qiandao/qiandao/list','GET','',''),('3d08283b362340c9946719f0f72dbd0b','1','å†…å®¹ç®¡ç†-æ ç›®è®¾ç½®-æ ç›®ç®¡ç†','1','2016-08-04 19:54:25','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/category/','GET','',''),('3e1998f638314ce2bad2a35f6ca207ed','1','ç³»ç»Ÿè®¾ç½®-æœºæ„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†-æŸ¥çœ‹','791290e1344945a993748b7df9a2b628','2016-08-04 17:07:14','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/list','GET','',''),('3ebf03e38ad54d82a37306d339a8f1ad','1','å†…å®¹ç®¡ç†-å†…å®¹ç®¡ç†','1','2016-08-04 19:52:13','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/tree','GET','',''),('4084a7f6d7374ee2bf736541b4051e8a','1','ç³»ç»Ÿè®¾ç½®-æœºæ„ç”¨æˆ·-æœºæ„ç®¡ç†-æŸ¥çœ‹','1','2016-08-04 16:00:34','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/office/list','GET','id=&parentIds=',''),('40aaba7eb389486389d96df79d4e1e85','1','åœ¨çº¿åŠå…¬-é€šçŸ¥é€šå‘Š-æˆ‘çš„é€šå‘Š','5cbc0c90dca846b88ab0b8a547006df2','2016-08-04 17:15:03','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/oa/oaNotify/self','GET','',''),('40ed7738efd8475a9777725eec731296','1','åœ¨çº¿åŠå…¬-é€šçŸ¥é€šå‘Š-æˆ‘çš„é€šå‘Š','5cbc0c90dca846b88ab0b8a547006df2','2016-08-04 17:14:51','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/oa/oaNotify/self','GET','',''),('441403e01eac42b0b964d7b40ef16086','1','ç³»ç»Ÿè®¾ç½®-æ—¥å¿—æŸ¥è¯¢-æ—¥å¿—æŸ¥è¯¢','791290e1344945a993748b7df9a2b628','2016-08-04 16:25:02','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/log','GET','',''),('4527f3d6a7024e9b8ade49f9e963d96b','1','åœ¨çº¿åŠå…¬-é€šçŸ¥é€šå‘Š-é€šå‘Šç®¡ç†','5cbc0c90dca846b88ab0b8a547006df2','2016-08-04 17:14:52','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/oa/oaNotify','GET','',''),('480864da45ba4ce6847ad04dcc891196','1','ç³»ç»Ÿç™»å½•','1','2016-08-04 16:23:32','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a','GET','login=',''),('4af320733ad143f59ca4e188933b0cb1','1','ä»£ç ç”Ÿæˆ-ä»£ç ç”Ÿæˆ-ä¸šåŠ¡è¡¨é…ç½®','1','2016-08-04 16:49:09','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/gen/genTable','GET','',''),('4c052637b46c4c908c15886975e74f97','1','åœ¨çº¿åŠå…¬-é€šçŸ¥é€šå‘Š-æˆ‘çš„é€šå‘Š','1','2016-08-04 15:57:02','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/oa/oaNotify/self','GET','',''),('4c12106246484bffa4cc9742cce1a87e','1','ç³»ç»Ÿè®¾ç½®-ç³»ç»Ÿè®¾ç½®-è§’è‰²ç®¡ç†','1','2016-08-04 19:52:10','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/role/','GET','repage=',''),('4c84b3af23134b2781b20b78ca4f2e6e','1','ç³»ç»Ÿè®¾ç½®-ç³»ç»Ÿè®¾ç½®-èœå•ç®¡ç†','1','2016-08-04 16:52:30','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/menu/','GET','',''),('4e41d42b3d22467abbe32edeaa9691ff','1','å†…å®¹ç®¡ç†-æ ç›®è®¾ç½®-æ ç›®ç®¡ç†-ä¿®æ”¹','1','2016-08-04 19:53:09','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/category/delete','GET','id=18',''),('4ec11c1fee794531a708e242dfdce279','1','æ•°æ®å®¡æ ¸-å­¦å‘˜ä¿¡æ¯-å¾…å®¡æ ¸','1','2016-08-04 19:10:14','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/resume/resume/list','GET','',''),('4f18cb0128ce4283b8d687faf3761be9','1','æˆ‘çš„é¢æ¿-ä¸ªäººä¿¡æ¯-ä¸ªäººä¿¡æ¯','791290e1344945a993748b7df9a2b628','2016-08-04 17:06:47','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','',''),('4f5cf04e0f0f4d7ca099b474e488f00b','1','ç³»ç»Ÿç™»å½•','1','2016-08-04 16:49:05','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a','GET','login=',''),('5012811945da473599bf23fa11522195','1','ç³»ç»Ÿç™»å½•','791290e1344945a993748b7df9a2b628','2016-08-04 19:37:26','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a;JSESSIONID=cb6498bbe37647d895755b2a09465623','GET','login=',''),('5109c7f23cf342c28c01176aa477284b','1','åœ¨çº¿åŠå…¬-é€šçŸ¥é€šå‘Š-æˆ‘çš„é€šå‘Š','7cfec60bc9c947f284bff8a0247fb500','2016-08-04 19:40:36','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/oa/oaNotify/self','GET','',''),('51240b7d64e94f04a5c835217b0a231f','1','å†…å®¹ç®¡ç†-å†…å®¹ç®¡ç†-å†…å®¹å‘å¸ƒ','1','2016-08-04 15:57:02','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/','GET','',''),('5184a6c1c00e4be7a22ba121b2d2aab0','1','ç³»ç»Ÿè®¾ç½®-æœºæ„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†-ä¿®æ”¹','1','2016-08-04 16:24:47','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/checkLoginName','GET','oldLoginName=13552471077&loginName=13552471077',''),('51ca5cdc4446461b9ba4ae4852c18492','1','ç³»ç»Ÿè®¾ç½®-ç³»ç»Ÿè®¾ç½®-è§’è‰²ç®¡ç†-ä¿®æ”¹','1','2016-08-04 16:55:58','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/role/save','POST','dataScope=4&officeIds=&remarks=&office.id=2&oldName=æ•™å¸ˆäºŒç»„&id=1ccb42e0cce74d74924271fb00b72269&menuIds=1,27,28,29,30,cb2b4da8a7374dc7b530146b0bff5126,71,56,57,58,59,62,88,89,90,31,40,53,54,55,60,61,2,...&useable=1&office.name=å…¬å¸é¢†å¯¼&name=æ•™å¸ˆäºŒç»„&roleType=user&oldEnname=teacher2&enname=teacher2&sysData=1',''),('51ee36b063564f578525814ce7ca21c0','1','ç³»ç»Ÿè®¾ç½®-ç³»ç»Ÿè®¾ç½®-è§’è‰²ç®¡ç†','1','2016-08-04 16:51:39','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/role/','GET','',''),('5242b4597fb14a45ac1448e0124d641c','1','æ•°æ®å®¡æ ¸-å­¦å‘˜ä¿¡æ¯-å¾…å®¡æ ¸','791290e1344945a993748b7df9a2b628','2016-08-04 19:37:29','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/resume/resume/list','GET','',''),('52ef5947108b4e88b605c353d7a7286e','1','ç³»ç»Ÿç™»å½•','1','2016-08-04 19:10:03','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a','GET','login=',''),('5485395356bf426eac1d14f32605823e','1','ç³»ç»Ÿè®¾ç½®-ç³»ç»Ÿè®¾ç½®-èœå•ç®¡ç†','1','2016-08-04 16:51:38','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/menu/','GET','',''),('574383ee75194952b4ee53341a66cc30','1','ç³»ç»Ÿè®¾ç½®-æœºæ„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†-æŸ¥çœ‹','1','2016-08-04 16:53:45','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/list','GET','repage=',''),('584719a67c374cbaa0ea20591797d67a','1','å†…å®¹ç®¡ç†-å†…å®¹ç®¡ç†','1','2016-08-04 15:57:02','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/none','GET','',''),('5859d001774e4101ab719c2a8387ac07','1','åœ¨çº¿åŠå…¬-é€šçŸ¥é€šå‘Š-æˆ‘çš„é€šå‘Š','7cfec60bc9c947f284bff8a0247fb500','2016-08-04 19:40:02','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/oa/oaNotify/self','GET','',''),('5fe64210cb15476b95187ad84de9d45b','1','åœ¨çº¿åŠå…¬-é€šçŸ¥é€šå‘Š-é€šå‘Šç®¡ç†','7cfec60bc9c947f284bff8a0247fb500','2016-08-04 19:40:06','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/oa/oaNotify','GET','',''),('62d0d8201f0343aeb9423ed347ac1319','1','ç³»ç»Ÿè®¾ç½®-æœºæ„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†','1','2016-08-04 16:49:09','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/index','GET','',''),('649d65ad4c33469bad8ff793cf12cd9b','1','æ•°æ®å®¡æ ¸-å­¦å‘˜ä¿¡æ¯-å¾…å®¡æ ¸','1','2016-08-04 17:13:34','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/resume/resume/list','GET','',''),('64cde722161844e59158a67a707721ce','1','ç³»ç»Ÿè®¾ç½®-æœºæ„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†-æŸ¥çœ‹','1','2016-08-04 16:24:33','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/list','GET','',''),('64eebf6093334030bf6e7482a1264ad5','1','æ•°æ®å®¡æ ¸-å­¦å‘˜ä¿¡æ¯-å®¡æ ¸','791290e1344945a993748b7df9a2b628','2016-08-04 17:06:48','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/resume/resume/list','GET','',''),('65af268b71fe40af805d0405621368fe','1','ç³»ç»Ÿè®¾ç½®-ç³»ç»Ÿè®¾ç½®-è§’è‰²ç®¡ç†','1','2016-08-04 16:55:51','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/role/','GET','',''),('670a051569334c17a3583c05a6f535eb','1','æ•°æ®å®¡æ ¸-å­¦å‘˜ä¿¡æ¯-å¾…å®¡æ ¸','1','2016-08-04 17:11:18','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/resume/resume/list','GET','',''),('6787d8ccf64342209fd01b4f3fc38a19','1','ç³»ç»Ÿè®¾ç½®-æœºæ„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†-æŸ¥çœ‹','1','2016-08-04 16:53:29','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/list','GET','',''),('68bf68c9751846a58429438afd96bf59','1','æ•°æ®å®¡æ ¸-å­¦å‘˜ä¿¡æ¯-å¾…å®¡æ ¸','1','2016-08-04 18:34:48','127.0.0.1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/resume/resume/list','GET','',''),('695a367bf5a741c49eb1e0d5ee0f0cda','1','æˆ‘çš„é¢æ¿-ä¸ªäººä¿¡æ¯-ä¸ªäººä¿¡æ¯','7cfec60bc9c947f284bff8a0247fb500','2016-08-04 19:40:43','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','',''),('6baff4ef2fd14ad589c3ebe30f47ad8d','1','å†…å®¹ç®¡ç†-æ ç›®è®¾ç½®-æ ç›®ç®¡ç†-æŸ¥çœ‹','1','2016-08-04 19:54:19','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/category/form','GET','id=10',''),('6c90498b64a94a2ba066c22afd68b30a','1','å†…å®¹ç®¡ç†-å†…å®¹ç®¡ç†-å†…å®¹å‘å¸ƒ-æ–‡ç« æ¨¡å‹','1','2016-08-04 15:57:05','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/article/','GET','category.id=3',''),('6ceca95bba1243bebf52c37df8d71172','1','ç³»ç»Ÿè®¾ç½®-æœºæ„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†-æŸ¥çœ‹','1','2016-08-04 15:57:01','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/list','GET','',''),('6de00c1d439042bda9157fa099a42332','1','ç³»ç»Ÿè®¾ç½®-æœºæ„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†-æŸ¥çœ‹','1','2016-08-04 16:55:46','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/list','GET','',''),('6e59172a141144808d3e808789c7f26e','1','ä»£ç ç”Ÿæˆ-ä»£ç ç”Ÿæˆ-ç”Ÿæˆæ–¹æ¡ˆé…ç½®','1','2016-08-04 17:11:52','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/gen/genScheme','GET','',''),('70e03647860c481891dc811f58d99921','1','å†…å®¹ç®¡ç†-ç»Ÿè®¡åˆ†æ-ä¿¡æ¯é‡ç»Ÿè®¡','1','2016-08-04 15:57:16','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/stats/article','GET','',''),('719b616787524fbca83d7080fbb00708','1','ç³»ç»Ÿè®¾ç½®-æœºæ„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†','1','2016-08-04 16:55:46','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/index','GET','',''),('73adaaadd1a04cd795ca387f8e1d3bef','1','æ•°æ®å®¡æ ¸-å­¦å‘˜ä¿¡æ¯-å®¡æ ¸','791290e1344945a993748b7df9a2b628','2016-08-04 16:25:05','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/resume/resume/list','GET','',''),('764794a263f44a368b3743bd545a29f6','1','å†…å®¹ç®¡ç†-æ ç›®è®¾ç½®-æ ç›®ç®¡ç†-ä¿®æ”¹','1','2016-08-04 19:53:57','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/category/save','POST','module=article&keywords=&sort=20&isAudit=0&inList=1&customContentView=&inMenu=1&image=&office.id=3&id=6&customListView=&office.name=ç»¼åˆéƒ¨&description=&parent.id=1&name=MAVEN&target=&allowComment=1&showModes=1&href=&viewConfig=&parent.name=é¡¶çº§æ ç›®',''),('76717b2b456c40ab81dad1fa0f1b06f8','1','ç³»ç»Ÿè®¾ç½®-æœºæ„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†-æŸ¥çœ‹','1','2016-08-04 17:07:22','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/list','GET','',''),('771e5fedc7874c50b301ed768a5611f6','1','å†…å®¹ç®¡ç†-æ ç›®è®¾ç½®-æ ç›®ç®¡ç†','1','2016-08-04 19:53:14','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/category/','GET','',''),('779498e2aea54e0fa397ad5f5c28cb03','1','ç³»ç»Ÿè®¾ç½®-æœºæ„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†-ä¿®æ”¹','1','2016-08-04 16:24:47','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/save','POST','phone=&newPassword=&oldLoginName=13552471077&no=230302198401235312&roleIdList=b7c2266283a94cd08b8c0060a0f3d405&remarks=&loginFlag=1&photo=&office.id=8dc8c943e1bd4c468c34308e9ce6a7eb&company.name=ä¸­è½¯ç‘è¾¾&userType=&confirmNewPassword=&id=54b732a7a8dd44c2b6745b64cf9e3e77&_roleIdList=on&email=&office.name=ä¸€ç»„&name=èµµä¿Šé¹&company.id=1&loginName=13552471077&mobile=13552471077',''),('77bd696328bd41bb94cf4f751514a163','1','æˆ‘çš„é¢æ¿-ä¸ªäººä¿¡æ¯-ä¸ªäººä¿¡æ¯','1','2016-08-04 19:42:02','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','',''),('782c406ad73943e4af970dc3bf5ddf6f','1','ç³»ç»Ÿè®¾ç½®-æœºæ„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†-æŸ¥çœ‹','1','2016-08-04 16:24:38','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/form','GET','id=54b732a7a8dd44c2b6745b64cf9e3e77',''),('789c03acae6444c2ae0f6fb5d8e2af0f','1','æˆ‘çš„é¢æ¿-ä¸ªäººä¿¡æ¯-ä¸ªäººä¿¡æ¯','1','2016-08-04 17:07:20','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','',''),('7906ce7f7b30411aa8b3f33d58ef1cc2','1','å†…å®¹ç®¡ç†-æ ç›®è®¾ç½®-æ ç›®ç®¡ç†','1','2016-08-04 19:52:21','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/category/','GET','',''),('7952c78ff8944903abbf2c0fa7a755eb','1','æˆ‘çš„é¢æ¿-ä¸ªäººä¿¡æ¯-ä¸ªäººä¿¡æ¯','1','2016-08-04 16:23:33','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','',''),('7a26592a06e4434a942a2d432d2e525e','1','å†…å®¹ç®¡ç†-å†…å®¹ç®¡ç†-å†…å®¹å‘å¸ƒ-æ–‡ç« æ¨¡å‹','1','2016-08-04 19:52:16','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/article/','GET','category.id=3',''),('7c49c801213e45a6ad82e10463be398a','1','ç³»ç»Ÿè®¾ç½®-æœºæ„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†-æŸ¥çœ‹','1','2016-08-04 16:52:07','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/list','GET','',''),('7c7a93156b694477a00bcc688caaa214','1','ç³»ç»Ÿè®¾ç½®-æœºæ„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†-æŸ¥çœ‹','1','2016-08-04 16:00:32','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/list','GET','',''),('7cdeb3c714554046befe9d23759587f5','1','ç³»ç»Ÿè®¾ç½®-æœºæ„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†-ä¿®æ”¹','1','2016-08-04 16:53:45','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/save','POST','phone=&no=gaiyuyan&oldLoginName=&newPassword=&roleIdList=1ccb42e0cce74d74924271fb00b72269&remarks=&loginFlag=1&photo=&office.id=bec64ac0838c400fb54d9ca823435a75&company.name=ä¸­è½¯ç‘è¾¾&userType=&id=&confirmNewPassword=&_roleIdList=on&email=&office.name=äºŒç»„&company.id=1&name=gaiyuyan&loginName=gaiyuyan&mobile=',''),('7e877297b62f4384926405f9fc531e91','1','ç³»ç»Ÿç™»å½•','27c5126e9403420983c6b692ffd1a29a','2016-08-04 17:06:34','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a','GET','login=',''),('7ef3fcc9a4b14979bb295c73018f0f67','1','æ•°æ®å®¡æ ¸-å­¦å‘˜ä¿¡æ¯-å®¡æ ¸','27c5126e9403420983c6b692ffd1a29a','2016-08-04 17:06:37','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/resume/resume/list','GET','',''),('7f339868a7094797be6082c9c21ab6e0','1','ç³»ç»Ÿè®¾ç½®-ç³»ç»Ÿè®¾ç½®-è§’è‰²ç®¡ç†','1','2016-08-04 16:52:31','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/role/','GET','',''),('811f81415e8e436aae894cc87b5ef108','1','å†…å®¹ç®¡ç†-æ ç›®è®¾ç½®-æ ç›®ç®¡ç†-ä¿®æ”¹','1','2016-08-04 19:52:35','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/category/delete','GET','id=25',''),('8127443b54e64e21ab897295114fe160','1','æ•°æ®å®¡æ ¸-å­¦å‘˜ä¿¡æ¯-å¾…å®¡æ ¸','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:10','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/resume/resume/list','GET','',''),('82462b27d2c64fa1a53937c2fdf52d27','1','ç³»ç»Ÿè®¾ç½®-æœºæ„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†','1','2016-08-04 16:52:06','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/index','GET','',''),('84b166e3a6cd48b0a5e5052d3a61f458','1','ç³»ç»Ÿè®¾ç½®-æ—¥å¿—æŸ¥è¯¢-æ—¥å¿—æŸ¥è¯¢','7cfec60bc9c947f284bff8a0247fb500','2016-08-04 19:40:42','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/log','GET','',''),('866e53a03a3a478f9459ae5956cb166a','1','æˆ‘çš„é¢æ¿-ä¸ªäººä¿¡æ¯-ä¸ªäººä¿¡æ¯','1','2016-08-04 19:10:06','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','',''),('879f911e79d54dfeb3864fff63845018','1','ç³»ç»Ÿè®¾ç½®-ç³»ç»Ÿè®¾ç½®-èœå•ç®¡ç†-æŸ¥çœ‹','1','2016-08-04 19:51:07','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/menu/form','GET','parent.id=e6a3e0370d5e4bedb450f20e48fcd2bd',''),('87a18a4898f74c819fc2f6f58f7747ca','1','å†…å®¹ç®¡ç†-å†…å®¹ç®¡ç†-å†…å®¹å‘å¸ƒ','1','2016-08-04 19:52:12','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/','GET','',''),('88dba31ba4a9401c9c967327125889a3','1','ç³»ç»Ÿè®¾ç½®-ç³»ç»Ÿè®¾ç½®-èœå•ç®¡ç†','1','2016-08-04 17:07:24','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/menu/','GET','',''),('8a102588a8a441c3b7a9abac5b615285','1','ç³»ç»Ÿè®¾ç½®-æœºæ„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†','1','2016-08-04 15:57:00','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/index','GET','',''),('8b214ec7851f4a77a67e98e6112113db','1','ç³»ç»Ÿè®¾ç½®-æœºæ„ç”¨æˆ·-æœºæ„ç®¡ç†','1','2016-08-04 16:00:33','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/office/','GET','',''),('8e086ec8082d4d17b1f4de377e64216b','1','ç³»ç»Ÿç™»å½•','27c5126e9403420983c6b692ffd1a29a','2016-08-04 16:53:50','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a','GET','login=',''),('8f0f4467204c4fa6a592e3a65061df8b','1','æ•°æ®å®¡æ ¸-å­¦å‘˜ä¿¡æ¯-å®¡æ ¸','1','2016-08-04 15:56:58','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/resume/resume/list','GET','',''),('93e825ea5b784898908182333694293a','1','ç³»ç»Ÿè®¾ç½®-æœºæ„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†-æŸ¥çœ‹','1','2016-08-04 16:24:01','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/list','GET','',''),('95835d7e3ee44058985e5d3e61c1663c','1','ç³»ç»Ÿè®¾ç½®-æ—¥å¿—æŸ¥è¯¢-æ—¥å¿—æŸ¥è¯¢','791290e1344945a993748b7df9a2b628','2016-08-04 16:51:27','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/log','GET','',''),('97c6c2fcc8e640ab8f849a5257db0b98','1','æ•°æ®å®¡æ ¸-å­¦å‘˜ä¿¡æ¯-å¾…å®¡æ ¸','1','2016-08-04 17:09:30','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/resume/resume/list','GET','',''),('98775937cc044733b5864923f9a558a2','1','ç³»ç»Ÿç™»å½•','1','2016-08-04 16:51:33','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a','GET','login=',''),('99004945eed04b618089020f6b9fc949','1','ç³»ç»Ÿè®¾ç½®-æœºæ„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†','1','2016-08-04 17:07:22','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/index','GET','',''),('994fa6e908604c68af5a4915ded28913','1','åœ¨çº¿åŠå…¬-é€šçŸ¥é€šå‘Š-æˆ‘çš„é€šå‘Š','7cfec60bc9c947f284bff8a0247fb500','2016-08-04 19:40:39','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/oa/oaNotify/self','GET','',''),('9a864393e51b42cda00eeccad00ccb65','1','å†…å®¹ç®¡ç†-æ ç›®è®¾ç½®-æ ç›®ç®¡ç†','1','2016-08-04 19:53:09','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/category/','GET','',''),('9b758843ee9b44e5ae83611bf9d19fef','1','ä»£ç ç”Ÿæˆ-ä»£ç ç”Ÿæˆ-ä¸šåŠ¡è¡¨é…ç½®','1','2016-08-04 17:13:34','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/gen/genTable','GET','',''),('9bdd7e56cb6d4d238d59e9f8b5193b1f','1','ä»£ç ç”Ÿæˆ-ä»£ç ç”Ÿæˆ-ä¸šåŠ¡è¡¨é…ç½®','1','2016-08-04 15:57:31','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/gen/genTable','GET','',''),('9ec20a0fb51244349b3fa845301de3cd','1','åœ¨çº¿åŠå…¬-é€šçŸ¥é€šå‘Š-æˆ‘çš„é€šå‘Š','7cfec60bc9c947f284bff8a0247fb500','2016-08-04 19:40:44','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/oa/oaNotify/self','GET','',''),('a008d75365ea4f69b6a028120398f47e','1','ç³»ç»Ÿè®¾ç½®-ç³»ç»Ÿè®¾ç½®-èœå•ç®¡ç†','1','2016-08-04 17:07:35','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/menu/','GET','',''),('a2a892c7d002479b9fa3c79f429e8225','1','æˆ‘çš„é¢æ¿-ä¸ªäººä¿¡æ¯-ä¿®æ”¹å¯†ç ','5cbc0c90dca846b88ab0b8a547006df2','2016-08-04 17:14:36','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/modifyPwd','GET','',''),('a2d14aab99a44962acb75b9e2aabbaef','1','ä»£ç ç”Ÿæˆ-ä»£ç ç”Ÿæˆ-ä¸šåŠ¡è¡¨é…ç½®','1','2016-08-04 17:13:36','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/gen/genTable','GET','',''),('a64062168b634aeaae5b48e3fa5df4a5','1','ç³»ç»Ÿè®¾ç½®-æœºæ„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†-æŸ¥çœ‹','1','2016-08-04 16:51:35','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/list','GET','',''),('a99ebca502704905858113fbbfd5c6d5','1','æˆ‘çš„é¢æ¿-ä¸ªäººä¿¡æ¯-ä¸ªäººä¿¡æ¯','1','2016-08-04 18:47:54','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','',''),('ad909d2dbd3f4e4cb9f917f5050647cf','1','æˆ‘çš„é¢æ¿-ä¸ªäººä¿¡æ¯-ä¸ªäººä¿¡æ¯','1','2016-08-04 17:09:30','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','',''),('aef1e6af4dab441488354a2ac109b34d','1','ç³»ç»Ÿç™»å½•','1','2016-08-04 19:50:28','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a','GET','login=',''),('b12a0ee59e1545c19169f844ba3075ed','1','ä»£ç ç”Ÿæˆ-ä»£ç ç”Ÿæˆ-ä¸šåŠ¡è¡¨é…ç½®','1','2016-08-04 15:56:59','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/gen/genTable','GET','',''),('b137e317146d43b49851d369eb1ae29e','1','åœ¨çº¿åŠå…¬-é€šçŸ¥é€šå‘Š-æˆ‘çš„é€šå‘Š','5cbc0c90dca846b88ab0b8a547006df2','2016-08-04 17:15:05','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/oa/oaNotify/self','GET','',''),('b16edd00dd4340efb0304ae9acf20e06','1','ç³»ç»Ÿç™»å½•','1','2016-08-04 17:07:19','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a','GET','login=',''),('b181706996584ef3976aed390083fbda','1','ç³»ç»Ÿç™»å½•','791290e1344945a993748b7df9a2b628','2016-08-04 17:06:47','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a','GET','login=',''),('b3423ceb171a45ba9b0b4083e917005b','1','ç³»ç»Ÿè®¾ç½®-æ—¥å¿—æŸ¥è¯¢-æ—¥å¿—æŸ¥è¯¢','7cfec60bc9c947f284bff8a0247fb500','2016-08-04 19:40:45','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/log','GET','',''),('b37838889a79421e9df0d6012029f203','1','ç³»ç»Ÿè®¾ç½®-ç³»ç»Ÿè®¾ç½®-è§’è‰²ç®¡ç†','1','2016-08-04 19:51:40','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/role/','GET','',''),('b444a3fc02964aa381ef7ad5d774ccc5','1','ç³»ç»Ÿè®¾ç½®-æœºæ„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†','1','2016-08-04 16:00:32','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/index','GET','',''),('b559935ef6724990aa0b7bbdeccc50be','1','æˆ‘çš„é¢æ¿-ä¸ªäººä¿¡æ¯-æˆ‘çš„ç­¾åˆ°','5cbc0c90dca846b88ab0b8a547006df2','2016-08-04 17:15:06','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/qiandao/qiandao/list','GET','',''),('b589d413fb7041c6853c2594e0ddc146','1','ç³»ç»Ÿè®¾ç½®-ç³»ç»Ÿè®¾ç½®-è§’è‰²ç®¡ç†-æŸ¥çœ‹','1','2016-08-04 19:51:43','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/role/form','GET','id=2338d11290ee4bf0b1e9b0c49786395e',''),('b6416a2207cc4ea2a4b09aaae1be46b7','1','ç³»ç»Ÿè®¾ç½®-æœºæ„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†','1','2016-08-04 16:51:35','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/index','GET','',''),('b76af1a569fb47e5882f6c9ba3d126a3','1','ç³»ç»Ÿç™»å½•','5cbc0c90dca846b88ab0b8a547006df2','2016-08-04 17:14:33','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a','GET','login=',''),('b84566eb45294cf08062d9997e032712','1','ç³»ç»Ÿç™»å½•','1','2016-08-04 18:34:28','127.0.0.1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a','GET','login=',''),('bb9878a20bf14bba9b8393289bf4cb46','1','å†…å®¹ç®¡ç†-æ ç›®è®¾ç½®-æ ç›®ç®¡ç†','1','2016-08-04 15:57:18','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/category/','GET','',''),('bc8373b0904f47caa5dcbb48d2deaf57','1','æ•°æ®å®¡æ ¸-å­¦å‘˜ä¿¡æ¯-å¾…å®¡æ ¸','1','2016-08-04 17:07:39','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/resume/resume/list','GET','',''),('be9b8d0fd2f247138933825b772ad1fb','1','ç³»ç»Ÿè®¾ç½®-æœºæ„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†-æŸ¥çœ‹','1','2016-08-04 16:24:32','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/list','GET','office.id=8dc8c943e1bd4c468c34308e9ce6a7eb&office.name=ä¸€ç»„',''),('c0cc9ab7ca454a70a916d4c6d0357611','1','ç³»ç»Ÿè®¾ç½®-æœºæ„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†','1','2016-08-04 19:42:04','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/index','GET','',''),('c1411cb5d5624478ada2c77317f71c18','1','å†…å®¹ç®¡ç†-å†…å®¹ç®¡ç†','1','2016-08-04 15:57:02','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/tree','GET','',''),('c2ed6ebbbe5f4bab9e67d9c054d3985a','1','æ•°æ®å®¡æ ¸-å­¦å‘˜ä¿¡æ¯-å®¡æ ¸','1','2016-08-04 15:56:55','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/resume/resume/list','GET','',''),('c3a347755a3844d2adf11bc2c7a48897','1','ç³»ç»Ÿè®¾ç½®-æœºæ„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†-æŸ¥çœ‹','1','2016-08-04 16:24:04','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/form','GET','',''),('c3bd166899be474cbaab2c3c54d8b309','1','æˆ‘çš„é¢æ¿-ä¸ªäººä¿¡æ¯-ä¸ªäººä¿¡æ¯','5cbc0c90dca846b88ab0b8a547006df2','2016-08-04 17:14:33','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','',''),('c4826aad9c494fecb9a5605aef4876e3','1','å†…å®¹ç®¡ç†-æ ç›®è®¾ç½®-æ ç›®ç®¡ç†-ä¿®æ”¹','1','2016-08-04 19:54:16','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/category/save','POST','module=article&keywords=&sort=10&isAudit=1&inList=1&customContentView=&inMenu=1&image=&office.id=3&id=2&customListView=&office.name=ç»¼åˆéƒ¨&description=&parent.id=1&name=JAVA&target=&allowComment=0&showModes=0&href=&viewConfig=&parent.name=é¡¶çº§æ ç›®',''),('c5f44e151665491f8de10e958904b3c0','1','æ•°æ®å®¡æ ¸-å­¦å‘˜ä¿¡æ¯-å®¡æ ¸','1','2016-08-04 16:51:09','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/resume/resume/list','GET','',''),('c79e1964da144484a2d3eafd145df672','1','æ•°æ®å®¡æ ¸-å­¦å‘˜ä¿¡æ¯-å¾…å®¡æ ¸','1','2016-08-04 20:05:33','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/resume/resume/list','GET','',''),('c7d2f09b85e24f63941eb383d684566b','1','ç³»ç»Ÿè®¾ç½®-ç³»ç»Ÿè®¾ç½®-èœå•ç®¡ç†','1','2016-08-04 16:55:49','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/menu/','GET','',''),('c8f228b4e4ee4a718401064c903b48e8','1','ç³»ç»Ÿè®¾ç½®-æœºæ„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†-æŸ¥çœ‹','1','2016-08-04 16:49:09','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/list','GET','',''),('d02435bf8e72445c826c266d674911b4','1','ç³»ç»Ÿè®¾ç½®-ç³»ç»Ÿè®¾ç½®-èœå•ç®¡ç†-æŸ¥çœ‹','1','2016-08-04 19:50:46','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/menu/form','GET','id=bac620c272f84f0988bde3c093c5e9f1',''),('d1251be7453b44e2bd12daad00dd7650','1','æ•°æ®å®¡æ ¸-å­¦å‘˜ä¿¡æ¯-å¾…å®¡æ ¸','1','2016-08-04 17:07:40','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/resume/resume/list','GET','',''),('d29ebb5af1174846a19f880fc4eddf49','1','ç³»ç»Ÿç™»å½•','1','2016-08-04 16:55:44','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a','GET','login=',''),('d2ffe518d4554a618de3de4219b63e85','1','ç³»ç»Ÿç™»å½•','1','2016-08-04 19:42:01','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a','GET','login=',''),('d46ed354287e4036a926d9045493a14b','1','ç³»ç»Ÿç™»å½•','1','2016-08-04 20:05:31','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/category/','GET','',''),('d4752a88705b4090be0a379223cf0fa4','1','æˆ‘çš„é¢æ¿-ä¸ªäººä¿¡æ¯-ä¸ªäººä¿¡æ¯','791290e1344945a993748b7df9a2b628','2016-08-04 16:25:01','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','',''),('d7e67ccb15c94c6c93a50682613d876e','1','æ•°æ®å®¡æ ¸-å­¦å‘˜ä¿¡æ¯-å®¡æ ¸','27c5126e9403420983c6b692ffd1a29a','2016-08-04 16:53:52','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/resume/resume/list','GET','',''),('da4b9f989f4b4311838eeb844f41059c','1','ç³»ç»Ÿè®¾ç½®-ç³»ç»Ÿè®¾ç½®-è§’è‰²ç®¡ç†-ä¿®æ”¹','1','2016-08-04 19:52:10','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/role/save','POST','dataScope=5&officeIds=&remarks=&office.id=2&oldName=æ•™å¸ˆä¸€ç»„&menuIds=1,27,28,29,30,cb2b4da8a7374dc7b530146b0bff5126,71,56,57,58,59,62,88,89,90,31,40,41,42,43,44,45,46...&id=2338d11290ee4bf0b1e9b0c49786395e&useable=1&office.name=å…¬å¸é¢†å¯¼&name=æ•™å¸ˆä¸€ç»„&roleType=user&sysData=1&enname=teacher1&oldEnname=teacher1',''),('dbae06f0f89747e5a1d71ed90e18ec37','1','å†…å®¹ç®¡ç†-æ ç›®è®¾ç½®-ç«™ç‚¹è®¾ç½®-æŸ¥çœ‹','1','2016-08-04 15:57:26','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/site/form','GET','id=2',''),('dcd7ca73411f49b698cbbcd21de1d594','1','ç³»ç»Ÿè®¾ç½®-ç³»ç»Ÿè®¾ç½®-è§’è‰²ç®¡ç†-æŸ¥çœ‹','1','2016-08-04 16:55:54','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/role/form','GET','id=1ccb42e0cce74d74924271fb00b72269',''),('de18a80519ce47b4bf0130189d61e978','1','å†…å®¹ç®¡ç†-æ ç›®è®¾ç½®-æ ç›®ç®¡ç†-ä¿®æ”¹','1','2016-08-04 19:53:14','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/category/delete','GET','id=24',''),('de23842a413e45e0901763ad0798ab43','1','ç³»ç»Ÿè®¾ç½®-ç³»ç»Ÿè®¾ç½®-èœå•ç®¡ç†-ä¿®æ”¹','1','2016-08-04 19:51:37','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/menu/save','POST','id=&icon=&sort=60&parent.id=e6a3e0370d5e4bedb450f20e48fcd2bd&name=æˆ‘çš„å­¦å‘˜&target=&permission=resume:student:view,resume:student:edit&remarks=&href=/resume/student/list&parent.name=å­¦å‘˜ä¿¡æ¯&isShow=1',''),('de275644913344f7bce363d687c73675','1','ç³»ç»Ÿè®¾ç½®-æ—¥å¿—æŸ¥è¯¢-æ—¥å¿—æŸ¥è¯¢','7cfec60bc9c947f284bff8a0247fb500','2016-08-04 19:39:47','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/log','GET','',''),('e3a8e6910af346288b3794051297f181','1','å†…å®¹ç®¡ç†-æ ç›®è®¾ç½®-ç«™ç‚¹è®¾ç½®','1','2016-08-04 15:57:22','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/site/','GET','',''),('e3be97a40c464f89944297cc29d73eec','1','æˆ‘çš„é¢æ¿-ä¸ªäººä¿¡æ¯-ä¸ªäººä¿¡æ¯','1','2016-08-04 16:49:06','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','',''),('e3cda1c0ffa149eea213f03e1be88a50','1','å†…å®¹ç®¡ç†-æ ç›®è®¾ç½®-æ ç›®ç®¡ç†','1','2016-08-04 19:54:07','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/category/','GET','',''),('e457d42e948e4458906144c560e363a9','1','æˆ‘çš„é¢æ¿-ä¸ªäººä¿¡æ¯-ä¸ªäººä¿¡æ¯','1','2016-08-04 16:51:07','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','',''),('e5ae2bd676c14b149e9bd210112c39c5','1','æˆ‘çš„é¢æ¿-ä¸ªäººä¿¡æ¯-ä¸ªäººä¿¡æ¯','27c5126e9403420983c6b692ffd1a29a','2016-08-04 16:53:51','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','',''),('e5d2dde58e3b4f12b9bec0fe66396eb2','1','ç³»ç»Ÿè®¾ç½®-ç³»ç»Ÿè®¾ç½®-èœå•ç®¡ç†-ä¿®æ”¹','1','2016-08-04 17:07:35','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/menu/save','POST','id=bac620c272f84f0988bde3c093c5e9f1&icon=&sort=30&parent.id=e6a3e0370d5e4bedb450f20e48fcd2bd&name=å¾…å®¡æ ¸&target=&permission=resume:resume:view,resume:resume:edit&remarks=&href=/resume/resume/list&parent.name=å­¦å‘˜ä¿¡æ¯&isShow=1',''),('e716ca1e034e48d08b8331973e003a64','1','ç³»ç»Ÿè®¾ç½®-ç³»ç»Ÿè®¾ç½®-è§’è‰²ç®¡ç†','1','2016-08-04 16:52:04','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/role/','GET','repage=',''),('e71b002138ef44198cb42a3ce904c707','1','ç³»ç»Ÿè®¾ç½®-ç³»ç»Ÿè®¾ç½®-èœå•ç®¡ç†','1','2016-08-04 19:51:37','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/menu/','GET','',''),('e890648c698d4da8a32222daf627f5a2','1','æ•°æ®å®¡æ ¸-å­¦å‘˜ä¿¡æ¯-å¾…å®¡æ ¸','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:07','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/resume/resume/list','GET','',''),('e8b5dcf4fa684550a9e3439046712ecd','1','æ•°æ®å®¡æ ¸-å­¦å‘˜ä¿¡æ¯-å®¡æ ¸','791290e1344945a993748b7df9a2b628','2016-08-04 16:51:20','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/resume/resume/list','GET','',''),('ea1bcad2603049a990c5115d0b0d4477','1','å†…å®¹ç®¡ç†-æ ç›®è®¾ç½®-æ ç›®ç®¡ç†-æŸ¥çœ‹','1','2016-08-04 19:53:45','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/category/form','GET','id=6',''),('ea3a9e12e68a4aada74ab6c60cba854e','1','å†…å®¹ç®¡ç†-å†…å®¹ç®¡ç†-å…¬å…±ç•™è¨€-æŸ¥çœ‹','1','2016-08-04 15:57:10','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/guestbook/','GET','status=2',''),('ea8634f18fc649b29365a1ae274a5093','1','æˆ‘çš„é¢æ¿-ä¸ªäººä¿¡æ¯-ä¸ªäººä¿¡æ¯','5cbc0c90dca846b88ab0b8a547006df2','2016-08-04 17:15:05','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','',''),('ebba252faead474cbbcf637417a1ffba','1','ç³»ç»Ÿç™»å½•','1','2016-08-04 15:56:51','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a','GET','login=',''),('ecbef9c2b33b46d0b074b42977183ea4','1','æˆ‘çš„é¢æ¿-ä¸ªäººä¿¡æ¯-ä¸ªäººä¿¡æ¯','27c5126e9403420983c6b692ffd1a29a','2016-08-04 17:06:36','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','',''),('eeeda30c7859413590dda179ad4f6101','1','ç³»ç»Ÿè®¾ç½®-æœºæ„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†-æŸ¥çœ‹','1','2016-08-04 19:50:33','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/list','GET','',''),('f2223cfb9801430eb1f63289658a0b89','1','ç³»ç»Ÿè®¾ç½®-æœºæ„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†-ä¿®æ”¹','1','2016-08-04 16:53:40','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/checkLoginName','GET','oldLoginName=&loginName=gaiyuyan',''),('f5a96a2b00824bc4b0b4c8682ab61165','1','å†…å®¹ç®¡ç†-æ ç›®è®¾ç½®-æ ç›®ç®¡ç†-æŸ¥çœ‹','1','2016-08-04 19:54:35','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/category/form','GET','id=6',''),('f8fa6497126d4f0fa3fe93ec36fcd8d1','1','ç³»ç»Ÿè®¾ç½®-æœºæ„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†','1','2016-08-04 16:24:33','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/index','GET','',''),('fa1a909afed941efbf6c742c637ba6f0','1','ç³»ç»Ÿè®¾ç½®-æ—¥å¿—æŸ¥è¯¢-æ—¥å¿—æŸ¥è¯¢','7cfec60bc9c947f284bff8a0247fb500','2016-08-04 19:40:37','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/log','GET','',''),('fa7b6ed19bde4d7d86fd96086eb5ca0b','1','å†…å®¹ç®¡ç†-æ ç›®è®¾ç½®-æ ç›®ç®¡ç†','1','2016-08-04 20:05:31','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/category/','GET','',''),('fb8efb5392684a73a8deab1f6795861e','1','å†…å®¹ç®¡ç†-ç»Ÿè®¡åˆ†æ-ä¿¡æ¯é‡ç»Ÿè®¡','791290e1344945a993748b7df9a2b628','2016-08-04 17:07:13','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/stats/article','GET','',''),('fe561b1c3e5043e0ac5dd58edb616cab','1','ä»£ç ç”Ÿæˆ-ä»£ç ç”Ÿæˆ-ä¸šåŠ¡è¡¨é…ç½®','1','2016-08-04 17:11:37','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/gen/genTable','GET','',''),('fe76962275904a1e949f8907f5456257','1','å†…å®¹ç®¡ç†-å†…å®¹ç®¡ç†','1','2016-08-04 19:52:13','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/none','GET','',''),('fed33693536948b2ad828d15ba275f78','1','ç³»ç»Ÿç™»å½•','1','2016-08-04 18:47:52','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a','GET','login=',''),('feecf76c97a14edd800168dbed0bc0d8','1','ç³»ç»Ÿè®¾ç½®-æœºæ„ç”¨æˆ·-ç”¨æˆ·ç®¡ç†','791290e1344945a993748b7df9a2b628','2016-08-04 17:07:14','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/index','GET','',''),('ff88f6822e2c414d93722224ac8554b7','1','æˆ‘çš„é¢æ¿-ä¸ªäººä¿¡æ¯-ä¸ªäººä¿¡æ¯','1','2016-08-04 19:50:31','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','','');
/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_mdict`
--

DROP TABLE IF EXISTS `sys_mdict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_mdict` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `parent_id` varchar(64) NOT NULL COMMENT 'çˆ¶çº§ç¼–å·',
  `parent_ids` varchar(2000) NOT NULL COMMENT 'æ‰€æœ‰çˆ¶çº§ç¼–å·',
  `name` varchar(100) NOT NULL COMMENT 'åç§°',
  `sort` decimal(10,0) NOT NULL COMMENT 'æ’åº',
  `description` varchar(100) DEFAULT NULL COMMENT 'æè¿°',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `sys_mdict_parent_id` (`parent_id`),
  KEY `sys_mdict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='å¤šçº§å­—å…¸è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_mdict`
--

LOCK TABLES `sys_mdict` WRITE;
/*!40000 ALTER TABLE `sys_mdict` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_mdict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `parent_id` varchar(64) NOT NULL COMMENT 'çˆ¶çº§ç¼–å·',
  `parent_ids` varchar(2000) NOT NULL COMMENT 'æ‰€æœ‰çˆ¶çº§ç¼–å·',
  `name` varchar(100) NOT NULL COMMENT 'åç§°',
  `sort` decimal(10,0) NOT NULL COMMENT 'æ’åº',
  `href` varchar(2000) DEFAULT NULL COMMENT 'é“¾æ¥',
  `target` varchar(20) DEFAULT NULL COMMENT 'ç›®æ ‡',
  `icon` varchar(100) DEFAULT NULL COMMENT 'å›¾æ ‡',
  `is_show` char(1) NOT NULL COMMENT 'æ˜¯å¦åœ¨èœå•ä¸­æ˜¾ç¤º',
  `permission` varchar(200) DEFAULT NULL COMMENT 'æƒé™æ ‡è¯†',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `sys_menu_parent_id` (`parent_id`),
  KEY `sys_menu_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='èœå•è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES ('0b2ebd4d639e4c2b83c2dd0764522f24','ba8092291b40482db8fe7fc006ea3d76','0,1,79,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,','ç¼–è¾‘',60,'','','','0','test:testData:edit','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('0ca004d6b1bf4bcab9670a5060d82a55','3c92c17886944d0687e73e286cada573','0,1,79,3c92c17886944d0687e73e286cada573,','æ ‘ç»“æ„',90,'/test/testTree','','','1','','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('1','0','0,','åŠŸèƒ½èœå•',0,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('10','3','0,1,2,3,','å­—å…¸ç®¡ç†',60,'/sys/dict/',NULL,'th-list','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('11','10','0,1,2,3,10,','æŸ¥çœ‹',30,NULL,NULL,NULL,'0','sys:dict:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('12','10','0,1,2,3,10,','ä¿®æ”¹',40,NULL,NULL,NULL,'0','sys:dict:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('13','2','0,1,2,','æœºæ„ç”¨æˆ·',970,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('14','13','0,1,2,13,','åŒºåŸŸç®¡ç†',50,'/sys/area/',NULL,'th','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('15','14','0,1,2,13,14,','æŸ¥çœ‹',30,NULL,NULL,NULL,'0','sys:area:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('16','14','0,1,2,13,14,','ä¿®æ”¹',40,NULL,NULL,NULL,'0','sys:area:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('17','13','0,1,2,13,','æœºæ„ç®¡ç†',40,'/sys/office/',NULL,'th-large','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('18','17','0,1,2,13,17,','æŸ¥çœ‹',30,NULL,NULL,NULL,'0','sys:office:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('19','17','0,1,2,13,17,','ä¿®æ”¹',40,NULL,NULL,NULL,'0','sys:office:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','1','0,1,','ç³»ç»Ÿè®¾ç½®',900,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('20','13','0,1,2,13,','ç”¨æˆ·ç®¡ç†',30,'/sys/user/index',NULL,'user','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('21','20','0,1,2,13,20,','æŸ¥çœ‹',30,NULL,NULL,NULL,'0','sys:user:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('22','20','0,1,2,13,20,','ä¿®æ”¹',40,NULL,NULL,NULL,'0','sys:user:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('23','2','0,1,2,','å…³äºå¸®åŠ©',990,NULL,NULL,NULL,'0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('24','23','0,1,2,23','å®˜æ–¹é¦–é¡µ',30,'http://jeesite.com','_blank',NULL,'0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('25','23','0,1,2,23','é¡¹ç›®æ”¯æŒ',50,'http://jeesite.com/donation.html','_blank',NULL,'0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('26','23','0,1,2,23','è®ºå›äº¤æµ',80,'http://bbs.jeesite.com','_blank',NULL,'0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('27','1','0,1,','æˆ‘çš„é¢æ¿',100,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('28','27','0,1,27,','ä¸ªäººä¿¡æ¯',30,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('29','28','0,1,27,28,','ä¸ªäººä¿¡æ¯',30,'/sys/user/info',NULL,'user','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','2','0,1,2,','ç³»ç»Ÿè®¾ç½®',980,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('30','28','0,1,27,28,','ä¿®æ”¹å¯†ç ',40,'/sys/user/modifyPwd',NULL,'lock','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('31','1','0,1,','å†…å®¹ç®¡ç†',500,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('32','31','0,1,31,','æ ç›®è®¾ç½®',990,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('33','32','0,1,31,32','æ ç›®ç®¡ç†',30,'/cms/category/',NULL,'align-justify','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('34','33','0,1,31,32,33,','æŸ¥çœ‹',30,NULL,NULL,NULL,'0','cms:category:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('35','33','0,1,31,32,33,','ä¿®æ”¹',40,NULL,NULL,NULL,'0','cms:category:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('36','32','0,1,31,32','ç«™ç‚¹è®¾ç½®',40,'/cms/site/',NULL,'certificate','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('37','36','0,1,31,32,36,','æŸ¥çœ‹',30,NULL,NULL,NULL,'0','cms:site:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('38','36','0,1,31,32,36,','ä¿®æ”¹',40,NULL,NULL,NULL,'0','cms:site:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('39','32','0,1,31,32','åˆ‡æ¢ç«™ç‚¹',50,'/cms/site/select',NULL,'retweet','1','cms:site:select','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3c92c17886944d0687e73e286cada573','79','0,1,79,','ç”Ÿæˆç¤ºä¾‹',120,'','','','1','','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('4','3','0,1,2,3,','èœå•ç®¡ç†',30,'/sys/menu/',NULL,'list-alt','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('40','31','0,1,31,','å†…å®¹ç®¡ç†',500,NULL,NULL,NULL,'1','cms:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('41','40','0,1,31,40,','å†…å®¹å‘å¸ƒ',30,'/cms/',NULL,'briefcase','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('42','41','0,1,31,40,41,','æ–‡ç« æ¨¡å‹',40,'/cms/article/',NULL,'file','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('43','42','0,1,31,40,41,42,','æŸ¥çœ‹',30,NULL,NULL,NULL,'0','cms:article:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('44','42','0,1,31,40,41,42,','ä¿®æ”¹',40,NULL,NULL,NULL,'0','cms:article:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('45','42','0,1,31,40,41,42,','å®¡æ ¸',50,NULL,NULL,NULL,'0','cms:article:audit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('46','41','0,1,31,40,41,','é“¾æ¥æ¨¡å‹',60,'/cms/link/',NULL,'random','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('47','46','0,1,31,40,41,46,','æŸ¥çœ‹',30,NULL,NULL,NULL,'0','cms:link:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('48','46','0,1,31,40,41,46,','ä¿®æ”¹',40,NULL,NULL,NULL,'0','cms:link:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4855cf3b25c244fb8500a380db189d97','b1f6d1b86ba24365bae7fd86c5082317','0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,','æŸ¥çœ‹',30,'','','','0','test:testDataMain:view','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('49','46','0,1,31,40,41,46,','å®¡æ ¸',50,NULL,NULL,NULL,'0','cms:link:audit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4f33f8a81d6c4746aabf595eac69b96c','e6a3e0370d5e4bedb450f20e48fcd2bd','0,1,6d0ec2aa7cc94378ba3fb4463306463c,e6a3e0370d5e4bedb450f20e48fcd2bd,','æˆ‘çš„å­¦å‘˜',60,'/resume/student/list','','','1','resume:student:view,resume:student:edit','1','2016-08-04 19:51:36','1','2016-08-04 19:51:36','','0'),('5','4','0,1,2,3,4,','æŸ¥çœ‹',30,NULL,NULL,NULL,'0','sys:menu:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('50','40','0,1,31,40,','è¯„è®ºç®¡ç†',40,'/cms/comment/?status=2',NULL,'comment','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('51','50','0,1,31,40,50,','æŸ¥çœ‹',30,NULL,NULL,NULL,'0','cms:comment:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('52','50','0,1,31,40,50,','å®¡æ ¸',40,NULL,NULL,NULL,'0','cms:comment:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('53','40','0,1,31,40,','å…¬å…±ç•™è¨€',80,'/cms/guestbook/?status=2',NULL,'glass','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('54','53','0,1,31,40,53,','æŸ¥çœ‹',30,NULL,NULL,NULL,'0','cms:guestbook:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('55','53','0,1,31,40,53,','å®¡æ ¸',40,NULL,NULL,NULL,'0','cms:guestbook:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('56','71','0,1,27,71,','æ–‡ä»¶ç®¡ç†',90,'/../static/ckfinder/ckfinder.html',NULL,'folder-open','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('57','56','0,1,27,40,56,','æŸ¥çœ‹',30,NULL,NULL,NULL,'0','cms:ckfinder:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('58','56','0,1,27,40,56,','ä¸Šä¼ ',40,NULL,NULL,NULL,'0','cms:ckfinder:upload','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('59','56','0,1,27,40,56,','ä¿®æ”¹',50,NULL,NULL,NULL,'0','cms:ckfinder:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6','4','0,1,2,3,4,','ä¿®æ”¹',40,NULL,NULL,NULL,'0','sys:menu:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('60','31','0,1,31,','ç»Ÿè®¡åˆ†æ',600,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('61','60','0,1,31,60,','ä¿¡æ¯é‡ç»Ÿè®¡',30,'/cms/stats/article',NULL,'tasks','1','cms:stats:article','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('62','1','0,1,','åœ¨çº¿åŠå…¬',200,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('63','62','0,1,62,','ä¸ªäººåŠå…¬',30,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('64','63','0,1,62,63,','è¯·å‡åŠç†',300,'/oa/leave',NULL,'leaf','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('65','64','0,1,62,63,64,','æŸ¥çœ‹',30,NULL,NULL,NULL,'0','oa:leave:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('66','64','0,1,62,63,64,','ä¿®æ”¹',40,NULL,NULL,NULL,'0','oa:leave:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('67','2','0,1,2,','æ—¥å¿—æŸ¥è¯¢',985,NULL,NULL,NULL,'1',NULL,'1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('68','67','0,1,2,67,','æ—¥å¿—æŸ¥è¯¢',30,'/sys/log',NULL,'pencil','1','sys:log:view','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('69','62','0,1,62,','æµç¨‹ç®¡ç†',300,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6d0ec2aa7cc94378ba3fb4463306463c','1','0,1,','æ•°æ®å®¡æ ¸',5030,'','','','1','','1','2016-08-02 11:02:46','1','2016-08-02 11:02:46','','0'),('7','3','0,1,2,3,','è§’è‰²ç®¡ç†',50,'/sys/role/',NULL,'lock','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('70','69','0,1,62,69,','æµç¨‹ç®¡ç†',50,'/act/process',NULL,'road','1','act:process:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('71','27','0,1,27,','æ–‡ä»¶ç®¡ç†',90,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('72','69','0,1,62,69,','æ¨¡å‹ç®¡ç†',100,'/act/model',NULL,'road','1','act:model:edit','1','2013-09-20 08:00:00','1','2013-09-20 08:00:00',NULL,'0'),('73','63','0,1,62,63,','æˆ‘çš„ä»»åŠ¡',50,'/act/task/todo/',NULL,'tasks','1',NULL,'1','2013-09-24 08:00:00','1','2013-09-24 08:00:00',NULL,'0'),('74','63','0,1,62,63,','å®¡æ‰¹æµ‹è¯•',100,'/oa/testAudit',NULL,NULL,'1','oa:testAudit:view,oa:testAudit:edit','1','2013-09-24 08:00:00','1','2013-09-24 08:00:00',NULL,'0'),('75','1','0,1,','åœ¨çº¿æ¼”ç¤º',3000,NULL,NULL,NULL,'1',NULL,'1','2013-10-08 08:00:00','1','2013-10-08 08:00:00',NULL,'1'),('79','1','0,1,','ä»£ç ç”Ÿæˆ',5000,NULL,NULL,NULL,'1',NULL,'1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'0'),('8','7','0,1,2,3,7,','æŸ¥çœ‹',30,NULL,NULL,NULL,'0','sys:role:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('80','79','0,1,79,','ä»£ç ç”Ÿæˆ',50,NULL,NULL,NULL,'1',NULL,'1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'0'),('81','80','0,1,79,80,','ç”Ÿæˆæ–¹æ¡ˆé…ç½®',30,'/gen/genScheme',NULL,NULL,'1','gen:genScheme:view,gen:genScheme:edit','1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'0'),('82','80','0,1,79,80,','ä¸šåŠ¡è¡¨é…ç½®',20,'/gen/genTable',NULL,NULL,'1','gen:genTable:view,gen:genTable:edit,gen:genTableColumn:view,gen:genTableColumn:edit','1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'0'),('83','80','0,1,79,80,','ä»£ç æ¨¡æ¿ç®¡ç†',90,'/gen/genTemplate',NULL,NULL,'1','gen:genTemplate:view,gen:genTemplate:edit','1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'1'),('84','67','0,1,2,67,','è¿æ¥æ± ç›‘è§†',40,'/../druid',NULL,NULL,'1',NULL,'1','2013-10-18 08:00:00','1','2013-10-18 08:00:00',NULL,'0'),('85','76','0,1,75,76,','è¡Œæ”¿åŒºåŸŸ',80,'/../static/map/map-city.html',NULL,NULL,'1',NULL,'1','2013-10-22 08:00:00','1','2013-10-22 08:00:00',NULL,'0'),('86','75','0,1,75,','ç»„ä»¶æ¼”ç¤º',50,NULL,NULL,NULL,'1',NULL,'1','2013-10-22 08:00:00','1','2013-10-22 08:00:00',NULL,'1'),('87','86','0,1,75,86,','ç»„ä»¶æ¼”ç¤º',30,'/test/test/form',NULL,NULL,'1','test:test:view,test:test:edit','1','2013-10-22 08:00:00','1','2013-10-22 08:00:00',NULL,'1'),('88','62','0,1,62,','é€šçŸ¥é€šå‘Š',20,'','','','1','','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('89','88','0,1,62,88,','æˆ‘çš„é€šå‘Š',30,'/oa/oaNotify/self','','','1','','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('9','7','0,1,2,3,7,','ä¿®æ”¹',40,NULL,NULL,NULL,'0','sys:role:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('90','88','0,1,62,88,','é€šå‘Šç®¡ç†',50,'/oa/oaNotify','','','1','oa:oaNotify:view,oa:oaNotify:edit','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('92f7ce9fbef642709186f0cc617cbb2c','27','0,1,27,','æˆ‘çš„ç­¾åˆ°',120,'/qiandao/qiandao/list','','','1','qiandao:qiandao:view','1','2016-08-01 18:09:56','1','2016-08-01 18:09:56','','1'),('afab2db430e2457f9cf3a11feaa8b869','0ca004d6b1bf4bcab9670a5060d82a55','0,1,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,','ç¼–è¾‘',60,'','','','0','test:testTree:edit','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('b1f6d1b86ba24365bae7fd86c5082317','3c92c17886944d0687e73e286cada573','0,1,79,3c92c17886944d0687e73e286cada573,','ä¸»å­è¡¨',60,'/test/testDataMain','','','1','','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('ba8092291b40482db8fe7fc006ea3d76','3c92c17886944d0687e73e286cada573','0,1,79,3c92c17886944d0687e73e286cada573,','å•è¡¨',30,'/test/testData','','','1','','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('bac620c272f84f0988bde3c093c5e9f1','e6a3e0370d5e4bedb450f20e48fcd2bd','0,1,6d0ec2aa7cc94378ba3fb4463306463c,e6a3e0370d5e4bedb450f20e48fcd2bd,','å¾…å®¡æ ¸',30,'/resume/resume/list','','','1','resume:resume:view,resume:resume:edit','1','2016-08-02 11:04:06','1','2016-08-04 17:07:35','','0'),('c2e4d9082a0b4386884a0b203afe2c5c','0ca004d6b1bf4bcab9670a5060d82a55','0,1,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,','æŸ¥çœ‹',30,'','','','0','test:testTree:view','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('cb2b4da8a7374dc7b530146b0bff5126','28','0,1,27,28,','æˆ‘çš„ç­¾åˆ°',70,'/qiandao/qiandao/list','','asterisk','1','qiandao:qiandao:view','1','2016-08-01 18:10:51','1','2016-08-01 19:04:16','','0'),('d15ec45a4c5449c3bbd7a61d5f9dd1d2','b1f6d1b86ba24365bae7fd86c5082317','0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,','ç¼–è¾‘',60,'','','','0','test:testDataMain:edit','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('df7ce823c5b24ff9bada43d992f373e2','ba8092291b40482db8fe7fc006ea3d76','0,1,79,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,','æŸ¥çœ‹',30,'','','','0','test:testData:view','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('e6a3e0370d5e4bedb450f20e48fcd2bd','6d0ec2aa7cc94378ba3fb4463306463c','0,1,6d0ec2aa7cc94378ba3fb4463306463c,','å­¦å‘˜ä¿¡æ¯',30,'','','','1','','1','2016-08-02 11:03:25','1','2016-08-02 11:04:18','','0');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_office`
--

DROP TABLE IF EXISTS `sys_office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_office` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `parent_id` varchar(64) NOT NULL COMMENT 'çˆ¶çº§ç¼–å·',
  `parent_ids` varchar(2000) NOT NULL COMMENT 'æ‰€æœ‰çˆ¶çº§ç¼–å·',
  `name` varchar(100) NOT NULL COMMENT 'åç§°',
  `sort` decimal(10,0) NOT NULL COMMENT 'æ’åº',
  `area_id` varchar(64) NOT NULL COMMENT 'å½’å±åŒºåŸŸ',
  `code` varchar(100) DEFAULT NULL COMMENT 'åŒºåŸŸç¼–ç ',
  `type` char(1) NOT NULL COMMENT 'æœºæ„ç±»å‹',
  `grade` char(1) NOT NULL COMMENT 'æœºæ„ç­‰çº§',
  `address` varchar(255) DEFAULT NULL COMMENT 'è”ç³»åœ°å€',
  `zip_code` varchar(100) DEFAULT NULL COMMENT 'é‚®æ”¿ç¼–ç ',
  `master` varchar(100) DEFAULT NULL COMMENT 'è´Ÿè´£äºº',
  `phone` varchar(200) DEFAULT NULL COMMENT 'ç”µè¯',
  `fax` varchar(200) DEFAULT NULL COMMENT 'ä¼ çœŸ',
  `email` varchar(200) DEFAULT NULL COMMENT 'é‚®ç®±',
  `USEABLE` varchar(64) DEFAULT NULL COMMENT 'æ˜¯å¦å¯ç”¨',
  `PRIMARY_PERSON` varchar(64) DEFAULT NULL COMMENT 'ä¸»è´Ÿè´£äºº',
  `DEPUTY_PERSON` varchar(64) DEFAULT NULL COMMENT 'å‰¯è´Ÿè´£äºº',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `sys_office_parent_id` (`parent_id`),
  KEY `sys_office_del_flag` (`del_flag`),
  KEY `sys_office_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æœºæ„è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_office`
--

LOCK TABLES `sys_office` WRITE;
/*!40000 ALTER TABLE `sys_office` DISABLE KEYS */;
INSERT INTO `sys_office` VALUES ('1','0','0,','ä¸­è½¯ç‘è¾¾',10,'2','100000','1','1','','','','','','','1','','','1','2013-05-27 08:00:00','1','2016-08-01 19:24:54','','0'),('10185106bec24a37afa3a18e5bf438de','ff0a982b3e954d61a5de9033402f5cf0','0,1,ff0a982b3e954d61a5de9033402f5cf0,','åç»„',30,'2','100000006010','2','2','','','','','','','1','','','1','2016-08-04 15:30:25','1','2016-08-04 15:30:25','','0'),('16923df7ef9342869cbb6dbad62fffa4','ff0a982b3e954d61a5de9033402f5cf0','0,1,ff0a982b3e954d61a5de9033402f5cf0,','åå…«ç»„',30,'2','100000006018','2','2','','','','','','','1','','','1','2016-08-04 15:31:19','1','2016-08-04 15:31:19','','0'),('1cbb11c515c44eb38625ff5a2544ab41','ff0a982b3e954d61a5de9033402f5cf0','0,1,ff0a982b3e954d61a5de9033402f5cf0,','å››ç»„',30,'2','100000006004','2','2','','','','','','','1','','','1','2016-08-04 15:29:48','1','2016-08-04 15:29:48','','0'),('2','1','0,1,','å…¬å¸é¢†å¯¼',10,'2','100001','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','1','0,1,','ç»¼åˆéƒ¨',20,'2','100002','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4','1','0,1,','å¸‚åœºéƒ¨',30,'2','100003','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('487e3e9429b64f1ebfd3b68c1d48cf12','ff0a982b3e954d61a5de9033402f5cf0','0,1,ff0a982b3e954d61a5de9033402f5cf0,','å…«ç»„',30,'2','100000006008','2','2','','','','','','','1','','','1','2016-08-04 15:30:11','1','2016-08-04 15:30:11','','0'),('5','1','0,1,','æŠ€æœ¯éƒ¨',40,'2','100004','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('550f28acf28b455cab0a04cf5dcab518','ff0a982b3e954d61a5de9033402f5cf0','0,1,ff0a982b3e954d61a5de9033402f5cf0,','åäºŒç»„',30,'2','100000006012','2','2','','','','','','','1','','','1','2016-08-04 15:30:40','1','2016-08-04 15:30:40','','0'),('6','1','0,1,','ç ”å‘éƒ¨',50,'2','100005','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('676c4605aa794a69b2bf6fe83c31bc50','ff0a982b3e954d61a5de9033402f5cf0','0,1,ff0a982b3e954d61a5de9033402f5cf0,','åå…­ç»„',30,'2','100000006016','2','2','','','','','','','1','','','1','2016-08-04 15:31:07','1','2016-08-04 15:31:07','','0'),('6ecb5f5678014671bf0abb2a311273a7','ff0a982b3e954d61a5de9033402f5cf0','0,1,ff0a982b3e954d61a5de9033402f5cf0,','äº”ç»„',30,'2','100000006005','2','2','','','','','','','1','','','1','2016-08-04 15:29:54','1','2016-08-04 15:29:54','','0'),('7f2113c936804b5a9523127668259063','ff0a982b3e954d61a5de9033402f5cf0','0,1,ff0a982b3e954d61a5de9033402f5cf0,','åäº”ç»„',30,'2','100000006015','2','2','','','','','','','1','','','1','2016-08-04 15:30:58','1','2016-08-04 15:30:58','','0'),('7fc0e8794d1f4e28b2f50ef7df0394cc','ff0a982b3e954d61a5de9033402f5cf0','0,1,ff0a982b3e954d61a5de9033402f5cf0,','åä¸ƒç»„',30,'2','100000006017','2','2','','','','','','','1','','','1','2016-08-04 15:31:14','1','2016-08-04 15:31:14','','0'),('8dc8c943e1bd4c468c34308e9ce6a7eb','ff0a982b3e954d61a5de9033402f5cf0','0,1,ff0a982b3e954d61a5de9033402f5cf0,','ä¸€ç»„',30,'2','100000006001','2','2','','','','','','','1','','','1','2016-08-04 15:29:16','1','2016-08-04 15:29:16','','0'),('9d68c06ad88b462c962e3ed549dbc875','ff0a982b3e954d61a5de9033402f5cf0','0,1,ff0a982b3e954d61a5de9033402f5cf0,','åä¹ç»„',30,'2','100000006019','2','2','','','','','','','1','','','1','2016-08-04 15:31:24','1','2016-08-04 15:31:24','','0'),('a8f981852b6b4d93b8e577d48b719e8d','ff0a982b3e954d61a5de9033402f5cf0','0,1,ff0a982b3e954d61a5de9033402f5cf0,','ä¸ƒç»„',30,'2','100000006007','2','2','','','','','','','1','','','1','2016-08-04 15:30:07','1','2016-08-04 15:30:07','','0'),('ab533e49d6d14ce8bda6b4df30d907da','ff0a982b3e954d61a5de9033402f5cf0','0,1,ff0a982b3e954d61a5de9033402f5cf0,','å…­ç»„',30,'2','100000006006','2','2','','','','','','','1','','','1','2016-08-04 15:30:00','1','2016-08-04 15:30:00','','0'),('bc2d5fa9984842e1ab003d72342f67a1','ff0a982b3e954d61a5de9033402f5cf0','0,1,ff0a982b3e954d61a5de9033402f5cf0,','åä¸€ç»„',30,'2','100000006011','2','2','','','','','','','1','','','1','2016-08-04 15:30:35','1','2016-08-04 15:30:35','','0'),('bec64ac0838c400fb54d9ca823435a75','ff0a982b3e954d61a5de9033402f5cf0','0,1,ff0a982b3e954d61a5de9033402f5cf0,','äºŒç»„',30,'2','100000006002','2','2','','','','','','','1','','','1','2016-08-04 15:29:27','1','2016-08-04 15:29:27','','0'),('c3963ac88d77402ab5f4918683beceba','ff0a982b3e954d61a5de9033402f5cf0','0,1,ff0a982b3e954d61a5de9033402f5cf0,','äºŒåç»„',30,'2','100000006020','2','2','','','','','','','1','','','1','2016-08-04 15:31:31','1','2016-08-04 15:31:31','','0'),('c39f0c50071b43db9157b110722db272','ff0a982b3e954d61a5de9033402f5cf0','0,1,ff0a982b3e954d61a5de9033402f5cf0,','åå››ç»„',30,'2','100000006014','2','2','','','','','','','1','','','1','2016-08-04 15:30:52','1','2016-08-04 15:30:52','','0'),('d9e168c2e7ec4711acee09e4732fd6b3','ff0a982b3e954d61a5de9033402f5cf0','0,1,ff0a982b3e954d61a5de9033402f5cf0,','ä¸‰ç»„',30,'2','100000006003','2','2','','','','','','','1','','','1','2016-08-04 15:29:41','1','2016-08-04 15:29:41','','0'),('deab837858c9485ba0c8a7ecadcdfd0c','ff0a982b3e954d61a5de9033402f5cf0','0,1,ff0a982b3e954d61a5de9033402f5cf0,','ä¹ç»„',30,'2','100000006009','2','2','','','','','','','1','','','1','2016-08-04 15:30:17','1','2016-08-04 15:30:17','','0'),('f6cc7046a9284b2c83c00d91fd9aea44','ff0a982b3e954d61a5de9033402f5cf0','0,1,ff0a982b3e954d61a5de9033402f5cf0,','åä¸‰ç»„',30,'2','100000006013','2','2','','','','','','','1','','','1','2016-08-04 15:30:46','1','2016-08-04 15:30:46','','0'),('ff0a982b3e954d61a5de9033402f5cf0','1','0,1,','æ•™è‚²éƒ¨',30,'2','100000006','2','1','','','','','','','1','','','1','2016-08-01 19:27:34','1','2016-08-04 11:03:51','','0');
/*!40000 ALTER TABLE `sys_office` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `office_id` varchar(64) DEFAULT NULL COMMENT 'å½’å±æœºæ„',
  `name` varchar(100) NOT NULL COMMENT 'è§’è‰²åç§°',
  `enname` varchar(255) DEFAULT NULL COMMENT 'è‹±æ–‡åç§°',
  `role_type` varchar(255) DEFAULT NULL COMMENT 'è§’è‰²ç±»å‹',
  `data_scope` char(1) DEFAULT NULL COMMENT 'æ•°æ®èŒƒå›´',
  `is_sys` varchar(64) DEFAULT NULL COMMENT 'æ˜¯å¦ç³»ç»Ÿæ•°æ®',
  `useable` varchar(64) DEFAULT NULL COMMENT 'æ˜¯å¦å¯ç”¨',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `sys_role_del_flag` (`del_flag`),
  KEY `sys_role_enname` (`enname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='è§’è‰²è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES ('1ccb42e0cce74d74924271fb00b72269','2','æ•™å¸ˆäºŒç»„','teacher2','user','4','1','1','1','2016-08-04 16:53:25','1','2016-08-04 16:55:58','','0'),('2','2','å…¬å¸ç®¡ç†å‘˜','administrator','security-role','2','1','1','1','2013-05-27 08:00:00','1','2016-08-02 11:04:56','','0'),('2338d11290ee4bf0b1e9b0c49786395e','2','æ•™å¸ˆä¸€ç»„','teacher1','user','5','1','1','1','2016-08-04 15:35:11','1','2016-08-04 19:52:10','','0'),('b7c2266283a94cd08b8c0060a0f3d405','ff0a982b3e954d61a5de9033402f5cf0','å­¦å‘˜','xueyuan','user','8','1','1','1','2016-08-01 19:28:24','1','2016-08-01 19:40:27','','0');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_menu` (
  `role_id` varchar(64) NOT NULL COMMENT 'è§’è‰²ç¼–å·',
  `menu_id` varchar(64) NOT NULL COMMENT 'èœå•ç¼–å·',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='è§’è‰²-èœå•';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES ('1','1'),('1','10'),('1','11'),('1','12'),('1','13'),('1','14'),('1','15'),('1','16'),('1','17'),('1','18'),('1','19'),('1','2'),('1','20'),('1','21'),('1','22'),('1','23'),('1','24'),('1','25'),('1','26'),('1','27'),('1','28'),('1','29'),('1','3'),('1','30'),('1','31'),('1','32'),('1','33'),('1','34'),('1','35'),('1','36'),('1','37'),('1','38'),('1','39'),('1','4'),('1','40'),('1','41'),('1','42'),('1','43'),('1','44'),('1','45'),('1','46'),('1','47'),('1','48'),('1','49'),('1','5'),('1','50'),('1','51'),('1','52'),('1','53'),('1','54'),('1','55'),('1','56'),('1','57'),('1','58'),('1','59'),('1','6'),('1','60'),('1','61'),('1','62'),('1','63'),('1','64'),('1','65'),('1','66'),('1','67'),('1','68'),('1','69'),('1','7'),('1','70'),('1','71'),('1','72'),('1','73'),('1','74'),('1','75'),('1','76'),('1','77'),('1','78'),('1','79'),('1','8'),('1','80'),('1','81'),('1','82'),('1','83'),('1','84'),('1','85'),('1','86'),('1','87'),('1','88'),('1','89'),('1','9'),('1','90'),('1ccb42e0cce74d74924271fb00b72269','1'),('1ccb42e0cce74d74924271fb00b72269','13'),('1ccb42e0cce74d74924271fb00b72269','2'),('1ccb42e0cce74d74924271fb00b72269','20'),('1ccb42e0cce74d74924271fb00b72269','21'),('1ccb42e0cce74d74924271fb00b72269','27'),('1ccb42e0cce74d74924271fb00b72269','28'),('1ccb42e0cce74d74924271fb00b72269','29'),('1ccb42e0cce74d74924271fb00b72269','30'),('1ccb42e0cce74d74924271fb00b72269','31'),('1ccb42e0cce74d74924271fb00b72269','40'),('1ccb42e0cce74d74924271fb00b72269','53'),('1ccb42e0cce74d74924271fb00b72269','54'),('1ccb42e0cce74d74924271fb00b72269','55'),('1ccb42e0cce74d74924271fb00b72269','56'),('1ccb42e0cce74d74924271fb00b72269','57'),('1ccb42e0cce74d74924271fb00b72269','58'),('1ccb42e0cce74d74924271fb00b72269','59'),('1ccb42e0cce74d74924271fb00b72269','60'),('1ccb42e0cce74d74924271fb00b72269','61'),('1ccb42e0cce74d74924271fb00b72269','62'),('1ccb42e0cce74d74924271fb00b72269','67'),('1ccb42e0cce74d74924271fb00b72269','68'),('1ccb42e0cce74d74924271fb00b72269','6d0ec2aa7cc94378ba3fb4463306463c'),('1ccb42e0cce74d74924271fb00b72269','71'),('1ccb42e0cce74d74924271fb00b72269','84'),('1ccb42e0cce74d74924271fb00b72269','88'),('1ccb42e0cce74d74924271fb00b72269','89'),('1ccb42e0cce74d74924271fb00b72269','90'),('1ccb42e0cce74d74924271fb00b72269','bac620c272f84f0988bde3c093c5e9f1'),('1ccb42e0cce74d74924271fb00b72269','cb2b4da8a7374dc7b530146b0bff5126'),('1ccb42e0cce74d74924271fb00b72269','e6a3e0370d5e4bedb450f20e48fcd2bd'),('2','0b2ebd4d639e4c2b83c2dd0764522f24'),('2','0ca004d6b1bf4bcab9670a5060d82a55'),('2','1'),('2','10'),('2','11'),('2','12'),('2','13'),('2','14'),('2','15'),('2','16'),('2','17'),('2','18'),('2','19'),('2','2'),('2','20'),('2','21'),('2','22'),('2','23'),('2','24'),('2','27'),('2','28'),('2','29'),('2','3'),('2','30'),('2','31'),('2','32'),('2','33'),('2','34'),('2','35'),('2','36'),('2','37'),('2','38'),('2','39'),('2','3c92c17886944d0687e73e286cada573'),('2','4'),('2','40'),('2','41'),('2','42'),('2','43'),('2','44'),('2','45'),('2','46'),('2','47'),('2','48'),('2','4855cf3b25c244fb8500a380db189d97'),('2','49'),('2','5'),('2','50'),('2','51'),('2','52'),('2','53'),('2','54'),('2','55'),('2','56'),('2','57'),('2','58'),('2','59'),('2','6'),('2','60'),('2','61'),('2','62'),('2','63'),('2','64'),('2','65'),('2','66'),('2','67'),('2','68'),('2','69'),('2','6d0ec2aa7cc94378ba3fb4463306463c'),('2','7'),('2','70'),('2','71'),('2','72'),('2','73'),('2','74'),('2','79'),('2','8'),('2','80'),('2','81'),('2','82'),('2','84'),('2','85'),('2','88'),('2','89'),('2','9'),('2','90'),('2','afab2db430e2457f9cf3a11feaa8b869'),('2','b1f6d1b86ba24365bae7fd86c5082317'),('2','ba8092291b40482db8fe7fc006ea3d76'),('2','bac620c272f84f0988bde3c093c5e9f1'),('2','c2e4d9082a0b4386884a0b203afe2c5c'),('2','cb2b4da8a7374dc7b530146b0bff5126'),('2','d15ec45a4c5449c3bbd7a61d5f9dd1d2'),('2','df7ce823c5b24ff9bada43d992f373e2'),('2','e6a3e0370d5e4bedb450f20e48fcd2bd'),('2338d11290ee4bf0b1e9b0c49786395e','1'),('2338d11290ee4bf0b1e9b0c49786395e','13'),('2338d11290ee4bf0b1e9b0c49786395e','2'),('2338d11290ee4bf0b1e9b0c49786395e','20'),('2338d11290ee4bf0b1e9b0c49786395e','21'),('2338d11290ee4bf0b1e9b0c49786395e','27'),('2338d11290ee4bf0b1e9b0c49786395e','28'),('2338d11290ee4bf0b1e9b0c49786395e','29'),('2338d11290ee4bf0b1e9b0c49786395e','30'),('2338d11290ee4bf0b1e9b0c49786395e','31'),('2338d11290ee4bf0b1e9b0c49786395e','40'),('2338d11290ee4bf0b1e9b0c49786395e','41'),('2338d11290ee4bf0b1e9b0c49786395e','42'),('2338d11290ee4bf0b1e9b0c49786395e','43'),('2338d11290ee4bf0b1e9b0c49786395e','44'),('2338d11290ee4bf0b1e9b0c49786395e','45'),('2338d11290ee4bf0b1e9b0c49786395e','46'),('2338d11290ee4bf0b1e9b0c49786395e','47'),('2338d11290ee4bf0b1e9b0c49786395e','48'),('2338d11290ee4bf0b1e9b0c49786395e','49'),('2338d11290ee4bf0b1e9b0c49786395e','4f33f8a81d6c4746aabf595eac69b96c'),('2338d11290ee4bf0b1e9b0c49786395e','50'),('2338d11290ee4bf0b1e9b0c49786395e','51'),('2338d11290ee4bf0b1e9b0c49786395e','52'),('2338d11290ee4bf0b1e9b0c49786395e','53'),('2338d11290ee4bf0b1e9b0c49786395e','54'),('2338d11290ee4bf0b1e9b0c49786395e','55'),('2338d11290ee4bf0b1e9b0c49786395e','56'),('2338d11290ee4bf0b1e9b0c49786395e','57'),('2338d11290ee4bf0b1e9b0c49786395e','58'),('2338d11290ee4bf0b1e9b0c49786395e','59'),('2338d11290ee4bf0b1e9b0c49786395e','60'),('2338d11290ee4bf0b1e9b0c49786395e','61'),('2338d11290ee4bf0b1e9b0c49786395e','62'),('2338d11290ee4bf0b1e9b0c49786395e','67'),('2338d11290ee4bf0b1e9b0c49786395e','68'),('2338d11290ee4bf0b1e9b0c49786395e','6d0ec2aa7cc94378ba3fb4463306463c'),('2338d11290ee4bf0b1e9b0c49786395e','71'),('2338d11290ee4bf0b1e9b0c49786395e','84'),('2338d11290ee4bf0b1e9b0c49786395e','88'),('2338d11290ee4bf0b1e9b0c49786395e','89'),('2338d11290ee4bf0b1e9b0c49786395e','90'),('2338d11290ee4bf0b1e9b0c49786395e','bac620c272f84f0988bde3c093c5e9f1'),('2338d11290ee4bf0b1e9b0c49786395e','cb2b4da8a7374dc7b530146b0bff5126'),('2338d11290ee4bf0b1e9b0c49786395e','e6a3e0370d5e4bedb450f20e48fcd2bd'),('3','1'),('3','10'),('3','11'),('3','12'),('3','13'),('3','14'),('3','15'),('3','16'),('3','17'),('3','18'),('3','19'),('3','2'),('3','20'),('3','21'),('3','22'),('3','23'),('3','24'),('3','25'),('3','26'),('3','27'),('3','28'),('3','29'),('3','3'),('3','30'),('3','31'),('3','32'),('3','33'),('3','34'),('3','35'),('3','36'),('3','37'),('3','38'),('3','39'),('3','4'),('3','40'),('3','41'),('3','42'),('3','43'),('3','44'),('3','45'),('3','46'),('3','47'),('3','48'),('3','49'),('3','5'),('3','50'),('3','51'),('3','52'),('3','53'),('3','54'),('3','55'),('3','56'),('3','57'),('3','58'),('3','59'),('3','6'),('3','60'),('3','61'),('3','62'),('3','63'),('3','64'),('3','65'),('3','66'),('3','67'),('3','68'),('3','69'),('3','7'),('3','70'),('3','71'),('3','72'),('3','73'),('3','74'),('3','75'),('3','76'),('3','77'),('3','78'),('3','79'),('3','8'),('3','80'),('3','81'),('3','82'),('3','83'),('3','84'),('3','85'),('3','86'),('3','87'),('3','88'),('3','89'),('3','9'),('3','90'),('b7c2266283a94cd08b8c0060a0f3d405','1'),('b7c2266283a94cd08b8c0060a0f3d405','2'),('b7c2266283a94cd08b8c0060a0f3d405','27'),('b7c2266283a94cd08b8c0060a0f3d405','28'),('b7c2266283a94cd08b8c0060a0f3d405','29'),('b7c2266283a94cd08b8c0060a0f3d405','30'),('b7c2266283a94cd08b8c0060a0f3d405','56'),('b7c2266283a94cd08b8c0060a0f3d405','57'),('b7c2266283a94cd08b8c0060a0f3d405','58'),('b7c2266283a94cd08b8c0060a0f3d405','59'),('b7c2266283a94cd08b8c0060a0f3d405','62'),('b7c2266283a94cd08b8c0060a0f3d405','67'),('b7c2266283a94cd08b8c0060a0f3d405','68'),('b7c2266283a94cd08b8c0060a0f3d405','71'),('b7c2266283a94cd08b8c0060a0f3d405','88'),('b7c2266283a94cd08b8c0060a0f3d405','89'),('b7c2266283a94cd08b8c0060a0f3d405','90'),('b7c2266283a94cd08b8c0060a0f3d405','cb2b4da8a7374dc7b530146b0bff5126');
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_office`
--

DROP TABLE IF EXISTS `sys_role_office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_office` (
  `role_id` varchar(64) NOT NULL COMMENT 'è§’è‰²ç¼–å·',
  `office_id` varchar(64) NOT NULL COMMENT 'æœºæ„ç¼–å·',
  PRIMARY KEY (`role_id`,`office_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='è§’è‰²-æœºæ„';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_office`
--

LOCK TABLES `sys_role_office` WRITE;
/*!40000 ALTER TABLE `sys_role_office` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_role_office` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `company_id` varchar(64) NOT NULL COMMENT 'å½’å±å…¬å¸',
  `office_id` varchar(64) NOT NULL COMMENT 'å½’å±éƒ¨é—¨',
  `login_name` varchar(100) NOT NULL COMMENT 'ç™»å½•å',
  `password` varchar(100) NOT NULL COMMENT 'å¯†ç ',
  `no` varchar(100) DEFAULT NULL COMMENT 'å·¥å·',
  `name` varchar(100) NOT NULL COMMENT 'å§“å',
  `email` varchar(200) DEFAULT NULL COMMENT 'é‚®ç®±',
  `phone` varchar(200) DEFAULT NULL COMMENT 'ç”µè¯',
  `mobile` varchar(200) DEFAULT NULL COMMENT 'æ‰‹æœº',
  `open_id` varchar(64) DEFAULT NULL,
  `account_no` varchar(20) DEFAULT NULL,
  `user_type` char(1) DEFAULT NULL COMMENT 'ç”¨æˆ·ç±»å‹',
  `photo` varchar(1000) DEFAULT NULL COMMENT 'ç”¨æˆ·å¤´åƒ',
  `login_ip` varchar(100) DEFAULT NULL COMMENT 'æœ€åç™»é™†IP',
  `login_date` datetime DEFAULT NULL COMMENT 'æœ€åç™»é™†æ—¶é—´',
  `login_flag` varchar(64) DEFAULT NULL COMMENT 'æ˜¯å¦å¯ç™»å½•',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `sys_user_office_id` (`office_id`),
  KEY `sys_user_login_name` (`login_name`),
  KEY `sys_user_company_id` (`company_id`),
  KEY `sys_user_update_date` (`update_date`),
  KEY `sys_user_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ç”¨æˆ·è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES ('1','1','2','admin','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0001','ç³»ç»Ÿç®¡ç†å‘˜','thinkgem@163.com','8675','8675',NULL,NULL,'','','0:0:0:0:0:0:0:1','2016-08-04 20:05:31','1','1','2013-05-27 08:00:00','1','2016-08-01 19:36:45','æœ€é«˜ç®¡ç†å‘˜','0'),('27c5126e9403420983c6b692ffd1a29a','1','bec64ac0838c400fb54d9ca823435a75','gaiyuyan','5a54b6de1d8913e0845c51b0d7a39ad5f4581b5e3ca9c4baea86d714','gaiyuyan','gaiyuyan','','','',NULL,NULL,'','','0:0:0:0:0:0:0:1','2016-08-04 17:06:34','1','1','2016-08-04 16:53:45','1','2016-08-04 16:53:45','','0'),('5cbc0c90dca846b88ab0b8a547006df2','1','ff0a982b3e954d61a5de9033402f5cf0','18801029695','cc4a8b8464f8021c1a922a05a9d7ec469212bdb94073b46f2e2ee8a6','230302198402175312','èµµä¿Šé£','',NULL,'18801029695',NULL,'2016080410000013',NULL,NULL,'0:0:0:0:0:0:0:1','2016-08-04 17:14:33','1','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:16',NULL,'0'),('72a0d38fa2654dea9423391acc251a02','1','ff0a982b3e954d61a5de9033402f5cf0','13552471077','2badb884a9e583ca75a57d3f1131672aa0aaa230bfa3f444eddd65b0','230302198402175333','èµµä¿Šé¹','',NULL,'13552471077',NULL,'2016080410000014',NULL,NULL,NULL,NULL,'1','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('791290e1344945a993748b7df9a2b628','1','8dc8c943e1bd4c468c34308e9ce6a7eb','zhaojunpeng','1bc04d30bd444641898e5a561629be5ccf1bb4715a4f7343a1a4407a','zhaojunpeng','zhaojunpeng','','','',NULL,NULL,'','','0:0:0:0:0:0:0:1','2016-08-04 19:37:26','1','1','2016-08-04 15:36:44','1','2016-08-04 15:36:44','','0'),('7cfec60bc9c947f284bff8a0247fb500','1','ff0a982b3e954d61a5de9033402f5cf0','18801029601','02f8425974f10102bc07e85469b5de9e84eef196d01ba7cf4a1cb747','230302198402175301','æç‡•é’','',NULL,'18801029601',NULL,'2016080410000015',NULL,NULL,'0:0:0:0:0:0:0:1','2016-08-04 19:39:40','1','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:17','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_role` (
  `user_id` varchar(64) NOT NULL COMMENT 'ç”¨æˆ·ç¼–å·',
  `role_id` varchar(64) NOT NULL COMMENT 'è§’è‰²ç¼–å·',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ç”¨æˆ·-è§’è‰²';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES ('03e9d302b91845e791721d435ca5791c','b7c2266283a94cd08b8c0060a0f3d405'),('1','2'),('17f86ad82bbb443383c6ba039d427ec5','b7c2266283a94cd08b8c0060a0f3d405'),('27c5126e9403420983c6b692ffd1a29a','1ccb42e0cce74d74924271fb00b72269'),('2c9c018166ef48cd8ceb53731a9da45b','b7c2266283a94cd08b8c0060a0f3d405'),('328bbf3dc085416eb14c6b8e097ab8aa','b7c2266283a94cd08b8c0060a0f3d405'),('331acc01aa7443cdb2f1e5db85e0996c','b7c2266283a94cd08b8c0060a0f3d405'),('4a461a50611346108ace098fc4b03c92','b7c2266283a94cd08b8c0060a0f3d405'),('54b732a7a8dd44c2b6745b64cf9e3e77','b7c2266283a94cd08b8c0060a0f3d405'),('5cbc0c90dca846b88ab0b8a547006df2','b7c2266283a94cd08b8c0060a0f3d405'),('5e37304fb40644d38101875235c9a5b7','b7c2266283a94cd08b8c0060a0f3d405'),('60079c2516bc434197e4fe79e359ffda','b7c2266283a94cd08b8c0060a0f3d405'),('6bb2266d33cb4c5fac7453b94c141c11','b7c2266283a94cd08b8c0060a0f3d405'),('71473fceee13499680b82e546cea9948','b7c2266283a94cd08b8c0060a0f3d405'),('72a0d38fa2654dea9423391acc251a02','b7c2266283a94cd08b8c0060a0f3d405'),('791290e1344945a993748b7df9a2b628','2338d11290ee4bf0b1e9b0c49786395e'),('7cfec60bc9c947f284bff8a0247fb500','b7c2266283a94cd08b8c0060a0f3d405'),('85469c5f6c314b8fb87301fb19ac08fb','b7c2266283a94cd08b8c0060a0f3d405'),('8ab761634bec4371adc1221d823970be','b7c2266283a94cd08b8c0060a0f3d405'),('9f49b4993089460ab242b28cb81ad170','b7c2266283a94cd08b8c0060a0f3d405'),('ce29a4e3cb1c48cc8404c8d83c84653f','b7c2266283a94cd08b8c0060a0f3d405'),('df7714ee986d4ae8ae81864295139673','b7c2266283a94cd08b8c0060a0f3d405'),('e7330332e49d4015b7209cd722ce9c57','b7c2266283a94cd08b8c0060a0f3d405'),('f20ebcb7f06441ef9dbe152fad12d72e','b7c2266283a94cd08b8c0060a0f3d405'),('fa3f7da071f944b698510226f994f5ed','b7c2266283a94cd08b8c0060a0f3d405');
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_data`
--

DROP TABLE IF EXISTS `test_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_data` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `user_id` varchar(64) DEFAULT NULL COMMENT 'å½’å±ç”¨æˆ·',
  `office_id` varchar(64) DEFAULT NULL COMMENT 'å½’å±éƒ¨é—¨',
  `area_id` varchar(64) DEFAULT NULL COMMENT 'å½’å±åŒºåŸŸ',
  `name` varchar(100) DEFAULT NULL COMMENT 'åç§°',
  `sex` char(1) DEFAULT NULL COMMENT 'æ€§åˆ«',
  `in_date` date DEFAULT NULL COMMENT 'åŠ å…¥æ—¥æœŸ',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `test_data_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ä¸šåŠ¡æ•°æ®è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_data`
--

LOCK TABLES `test_data` WRITE;
/*!40000 ALTER TABLE `test_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_data_child`
--

DROP TABLE IF EXISTS `test_data_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_data_child` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `test_data_main_id` varchar(64) DEFAULT NULL COMMENT 'ä¸šåŠ¡ä¸»è¡¨ID',
  `name` varchar(100) DEFAULT NULL COMMENT 'åç§°',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `test_data_child_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ä¸šåŠ¡æ•°æ®å­è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_data_child`
--

LOCK TABLES `test_data_child` WRITE;
/*!40000 ALTER TABLE `test_data_child` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_data_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_data_main`
--

DROP TABLE IF EXISTS `test_data_main`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_data_main` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `user_id` varchar(64) DEFAULT NULL COMMENT 'å½’å±ç”¨æˆ·',
  `office_id` varchar(64) DEFAULT NULL COMMENT 'å½’å±éƒ¨é—¨',
  `area_id` varchar(64) DEFAULT NULL COMMENT 'å½’å±åŒºåŸŸ',
  `name` varchar(100) DEFAULT NULL COMMENT 'åç§°',
  `sex` char(1) DEFAULT NULL COMMENT 'æ€§åˆ«',
  `in_date` date DEFAULT NULL COMMENT 'åŠ å…¥æ—¥æœŸ',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `test_data_main_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='ä¸šåŠ¡æ•°æ®è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_data_main`
--

LOCK TABLES `test_data_main` WRITE;
/*!40000 ALTER TABLE `test_data_main` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_data_main` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_tree`
--

DROP TABLE IF EXISTS `test_tree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_tree` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `parent_id` varchar(64) NOT NULL COMMENT 'çˆ¶çº§ç¼–å·',
  `parent_ids` varchar(2000) NOT NULL COMMENT 'æ‰€æœ‰çˆ¶çº§ç¼–å·',
  `name` varchar(100) NOT NULL COMMENT 'åç§°',
  `sort` decimal(10,0) NOT NULL COMMENT 'æ’åº',
  `create_by` varchar(64) NOT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime NOT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) NOT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime NOT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT 'åˆ é™¤æ ‡è®°',
  PRIMARY KEY (`id`),
  KEY `test_tree_del_flag` (`del_flag`),
  KEY `test_data_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='æ ‘ç»“æ„è¡¨';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_tree`
--

LOCK TABLES `test_tree` WRITE;
/*!40000 ALTER TABLE `test_tree` DISABLE KEYS */;
/*!40000 ALTER TABLE `test_tree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_location`
--

DROP TABLE IF EXISTS `wechat_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_location` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `openid` varchar(200) NOT NULL COMMENT 'ç”¨æˆ·çš„æ ‡è¯†ï¼Œå¯¹å½“å‰å…¬ä¼—å·å”¯ä¸€',
  `precision` varchar(200) DEFAULT NULL COMMENT 'åœ°ç†ä½ç½®ç²¾åº¦',
  `latitude` varchar(200) DEFAULT NULL COMMENT 'åœ°ç†ä½ç½®çº¬åº¦',
  `longitude` varchar(200) DEFAULT NULL COMMENT 'åœ°ç†ä½ç½®ç»åº¦',
  `location_x` varchar(200) DEFAULT NULL COMMENT 'location_x',
  `location_y` varchar(200) DEFAULT NULL COMMENT 'location_y',
  `create_by` varchar(64) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT 'çŠ¶æ€',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_location`
--

LOCK TABLES `wechat_location` WRITE;
/*!40000 ALTER TABLE `wechat_location` DISABLE KEYS */;
/*!40000 ALTER TABLE `wechat_location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wechat_member`
--

DROP TABLE IF EXISTS `wechat_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wechat_member` (
  `id` varchar(64) NOT NULL COMMENT 'ç¼–å·',
  `subscribe` varchar(200) DEFAULT NULL COMMENT 'ç”¨æˆ·æ˜¯å¦è®¢é˜…è¯¥å…¬ä¼—å·æ ‡è¯†ï¼Œå€¼ä¸º0æ—¶ï¼Œä»£è¡¨æ­¤ç”¨æˆ·æ²¡æœ‰å…³æ³¨è¯¥å…¬ä¼—å·ï¼Œæ‹‰å–ä¸åˆ°å…¶ä½™ä¿¡æ¯ã€‚',
  `openid` varchar(200) NOT NULL COMMENT 'ç”¨æˆ·çš„æ ‡è¯†ï¼Œå¯¹å½“å‰å…¬ä¼—å·å”¯ä¸€',
  `nickname` varchar(200) DEFAULT NULL COMMENT 'ç”¨æˆ·çš„æ˜µç§°',
  `sex` varchar(200) DEFAULT NULL COMMENT 'ç”¨æˆ·çš„æ€§åˆ«ï¼Œå€¼ä¸º1æ—¶æ˜¯ç”·æ€§ï¼Œå€¼ä¸º2æ—¶æ˜¯å¥³æ€§ï¼Œå€¼ä¸º0æ—¶æ˜¯æœªçŸ¥',
  `city` varchar(200) DEFAULT NULL COMMENT 'ç”¨æˆ·æ‰€åœ¨åŸå¸‚',
  `country` varchar(200) DEFAULT NULL COMMENT 'ç”¨æˆ·æ‰€åœ¨å›½å®¶',
  `province` varchar(200) DEFAULT NULL COMMENT 'ç”¨æˆ·æ‰€åœ¨çœä»½',
  `language` varchar(200) DEFAULT NULL COMMENT 'ç”¨æˆ·çš„è¯­è¨€ï¼Œç®€ä½“ä¸­æ–‡ä¸ºzh_CN',
  `headimgurl` varchar(200) DEFAULT NULL COMMENT 'ç”¨æˆ·å¤´åƒï¼Œæœ€åä¸€ä¸ªæ•°å€¼ä»£è¡¨æ­£æ–¹å½¢å¤´åƒå¤§å°ï¼ˆæœ‰0ã€46ã€64ã€96ã€132æ•°å€¼å¯é€‰ï¼Œ0ä»£è¡¨640*640æ­£æ–¹å½¢å¤´åƒï¼‰ï¼Œç”¨æˆ·æ²¡æœ‰å¤´åƒæ—¶è¯¥é¡¹ä¸ºç©ºã€‚è‹¥ç”¨æˆ·æ›´æ¢å¤´åƒï¼ŒåŸæœ‰å¤´åƒURLå°†å¤±æ•ˆã€‚',
  `subscribe_time` varchar(200) DEFAULT NULL COMMENT 'ç”¨æˆ·å…³æ³¨æ—¶é—´ï¼Œä¸ºæ—¶é—´æˆ³ã€‚å¦‚æœç”¨æˆ·æ›¾å¤šæ¬¡å…³æ³¨ï¼Œåˆ™å–æœ€åå…³æ³¨æ—¶é—´',
  `unionid` varchar(200) DEFAULT NULL COMMENT 'åªæœ‰åœ¨ç”¨æˆ·å°†å…¬ä¼—å·ç»‘å®šåˆ°å¾®ä¿¡å¼€æ”¾å¹³å°å¸å·åï¼Œæ‰ä¼šå‡ºç°è¯¥å­—æ®µã€‚',
  `remark` varchar(200) DEFAULT NULL COMMENT 'å…¬ä¼—å·è¿è¥è€…å¯¹ç²‰ä¸çš„å¤‡æ³¨ï¼Œå…¬ä¼—å·è¿è¥è€…å¯åœ¨å¾®ä¿¡å…¬ä¼—å¹³å°ç”¨æˆ·ç®¡ç†ç•Œé¢å¯¹ç²‰ä¸æ·»åŠ å¤‡æ³¨',
  `groupid` varchar(200) DEFAULT NULL COMMENT 'ç”¨æˆ·æ‰€åœ¨çš„åˆ†ç»„IDï¼ˆå…¼å®¹æ—§çš„ç”¨æˆ·åˆ†ç»„æ¥å£ï¼‰',
  `create_by` varchar(64) DEFAULT NULL COMMENT 'åˆ›å»ºè€…',
  `create_date` datetime DEFAULT NULL COMMENT 'åˆ›å»ºæ—¶é—´',
  `update_by` varchar(64) DEFAULT NULL COMMENT 'æ›´æ–°è€…',
  `update_date` datetime DEFAULT NULL COMMENT 'æ›´æ–°æ—¶é—´',
  `remarks` varchar(255) DEFAULT NULL COMMENT 'å¤‡æ³¨ä¿¡æ¯',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT 'å·²å…³æ³¨',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_member`
--

LOCK TABLES `wechat_member` WRITE;
/*!40000 ALTER TABLE `wechat_member` DISABLE KEYS */;
INSERT INTO `wechat_member` VALUES ('b324953094de4bed8c1e28c98c0cb3af','1','o4Sx-wMwxW9SO6QvaoasVDCgmF2k','è¶èˆ','å¥³æ€§','æµ·æ·€','ä¸­å›½','åŒ—äº¬','zh_CN','http://wx.qlogo.cn/mmopen/qENnrtFuS8djLf8ZANicW6FSB4llBZbfDSMibwUdyoSS6IsibLVML21XMqpzThLibhogaMhK7cjwUEnZZ4pTy8QUxKMO9LUs6icWV/0','1468920174',NULL,'','0',NULL,'2016-07-19 17:23:07',NULL,'2016-07-19 17:23:07',NULL,'0'),('bb349d8cbc784b489ee662007ddd34ec','1','o4Sx-wE6XiheDate5lBX9OO-gHxw','å‡è£…æ²¡æ„Ÿè§‰','ç”·æ€§','','ä¸­å›½','åŒ—äº¬','zh_CN','http://wx.qlogo.cn/mmopen/PiajxSqBRaEIYzZGlQEAcia78RQJmuEiawc1rTIXNj2c7JbNLuHiag0QVKuPlDdYdBH4acrOYpy5eeEjX17JfVo7hA/0','1470125767',NULL,'','0',NULL,'2016-07-18 21:17:43',NULL,'2016-08-02 16:16:14',NULL,'0');
/*!40000 ALTER TABLE `wechat_member` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-08-01 16:50:17
