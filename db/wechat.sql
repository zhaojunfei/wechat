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
INSERT INTO `act_ge_bytearray` VALUES ('307b0f7a57534bb9ac12d0f804537788',1,'test_audit.bpmn20.xml','d6403c84f1a743c1ab89e888519bd87d','<?xml version=\'1.0\' encoding=\'UTF-8\'?>\r\n<definitions xmlns=\"http://www.omg.org/spec/BPMN/20100524/MODEL\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:activiti=\"http://activiti.org/bpmn\" xmlns:bpmndi=\"http://www.omg.org/spec/BPMN/20100524/DI\" xmlns:omgdc=\"http://www.omg.org/spec/DD/20100524/DC\" xmlns:omgdi=\"http://www.omg.org/spec/DD/20100524/DI\" typeLanguage=\"http://www.w3.org/2001/XMLSchema\" expressionLanguage=\"http://www.w3.org/1999/XPath\" targetNamespace=\"http://www.activiti.org/test\">\r\n  <process id=\"test_audit\" name=\"流程审批测试流程\" isExecutable=\"true\">\r\n    <startEvent id=\"start\" name=\"启动审批\" activiti:initiator=\"apply\" activiti:formKey=\"/oa/testAudit/form\"/>\r\n    <endEvent id=\"end\" name=\"结束审批\"/>\r\n    <userTask id=\"modify\" name=\"员工薪酬档级修改\" activiti:assignee=\"${apply}\"/>\r\n    <userTask id=\"audit\" name=\"薪酬主管初审\" activiti:assignee=\"thinkgem\"/>\r\n    <exclusiveGateway id=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\"/>\r\n    <userTask id=\"audit2\" name=\"集团人力资源部部长审核\" activiti:assignee=\"thinkgem\"/>\r\n    <exclusiveGateway id=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\"/>\r\n    <sequenceFlow id=\"sid-EF2F51BB-1D99-4F0B-ACF2-B6C1300A7D2B\" sourceRef=\"audit2\" targetRef=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\"/>\r\n    <userTask id=\"audit3\" name=\"集团人力资源部分管领导审核\" activiti:assignee=\"thinkgem\"/>\r\n    <exclusiveGateway id=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\"/>\r\n    <sequenceFlow id=\"sid-3DBCD661-5720-4480-8156-748BE0275FEF\" sourceRef=\"audit3\" targetRef=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\"/>\r\n    <userTask id=\"audit4\" name=\"集团总经理审批\" activiti:assignee=\"thinkgem\"/>\r\n    <exclusiveGateway id=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\"/>\r\n    <userTask id=\"apply_end\" name=\"薪酬档级兑现\" activiti:assignee=\"thinkgem\"/>\r\n    <sequenceFlow id=\"sid-02DB2AD9-1332-4198-AC8D-22A35169D15C\" sourceRef=\"audit4\" targetRef=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\"/>\r\n    <sequenceFlow id=\"sid-2AB7C01A-50EE-4AAC-8C8F-F6E1935B3DA7\" sourceRef=\"audit\" targetRef=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\"/>\r\n    <sequenceFlow id=\"sid-36E50C8B-6C7C-4968-B02D-EBAA425BF4BE\" sourceRef=\"start\" targetRef=\"audit\"/>\r\n    <sequenceFlow id=\"sid-7D723190-1432-411D-A4A4-774225E54CD9\" name=\"是\" sourceRef=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\" targetRef=\"apply_end\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-D44CAD43-0271-4920-A524-9B8533E52550\" name=\"是\" sourceRef=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\" targetRef=\"audit4\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-53258502-43EE-4DE8-B1A4-DBD11922B8AF\" name=\"否\" sourceRef=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\" targetRef=\"modify\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <exclusiveGateway id=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\"/>\r\n    <sequenceFlow id=\"sid-163DBC60-DBC9-438B-971A-67738FB7715A\" sourceRef=\"modify\" targetRef=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\"/>\r\n    <sequenceFlow id=\"sid-72258A41-203E-428C-B71D-CA3506252D73\" name=\"是\" sourceRef=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\" targetRef=\"audit2\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-8448EF4A-B62E-4899-ABC2-0E2DB2AE6838\" name=\"重新申请\" sourceRef=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\" targetRef=\"audit\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-A7589084-4623-4FEA-A774-00A70DDC1D20\" name=\"是\" sourceRef=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\" targetRef=\"audit3\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==1}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-FA618636-3708-4D0C-8514-29A4BB8BC926\" name=\"否\" sourceRef=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\" targetRef=\"modify\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-1525BFF4-3E9D-4D8A-BF80-1F63AFE16289\" name=\"否\" sourceRef=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\" targetRef=\"modify\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-35CC8C6C-1067-4398-991C-CCF955115965\" name=\"否\" sourceRef=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\" targetRef=\"modify\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\r\n    </sequenceFlow>\r\n    <sequenceFlow id=\"sid-BDB0AAB2-7E50-4D35-80EE-CE0BECDD9F57\" sourceRef=\"apply_end\" targetRef=\"end\"/>\r\n    <sequenceFlow id=\"sid-44AFB9C1-4057-4C48-B1F2-1EC897A52CB7\" name=\"销毁\" sourceRef=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\" targetRef=\"end\">\r\n      <conditionExpression xsi:type=\"tFormalExpression\"><![CDATA[${pass==0}]]></conditionExpression>\r\n    </sequenceFlow>\r\n  </process>\r\n  <bpmndi:BPMNDiagram id=\"BPMNDiagram_test_audit\">\r\n    <bpmndi:BPMNPlane bpmnElement=\"test_audit\" id=\"BPMNPlane_test_audit\">\r\n      <bpmndi:BPMNShape bpmnElement=\"start\" id=\"BPMNShape_start\">\r\n        <omgdc:Bounds height=\"30.0\" width=\"30.0\" x=\"30.0\" y=\"245.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"end\" id=\"BPMNShape_end\">\r\n        <omgdc:Bounds height=\"28.0\" width=\"28.0\" x=\"975.0\" y=\"356.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"modify\" id=\"BPMNShape_modify\">\r\n        <omgdc:Bounds height=\"58.0\" width=\"102.0\" x=\"209.0\" y=\"135.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"audit\" id=\"BPMNShape_audit\">\r\n        <omgdc:Bounds height=\"57.0\" width=\"96.0\" x=\"105.0\" y=\"231.5\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"sid-C28BB5F6-013D-4570-B432-61B380C1F46F\" id=\"BPMNShape_sid-C28BB5F6-013D-4570-B432-61B380C1F46F\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"240.0\" y=\"240.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"audit2\" id=\"BPMNShape_audit2\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"210.0\" y=\"330.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\" id=\"BPMNShape_sid-ED46FE41-A0FD-496D-86DC-2C97AF5735F0\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"345.0\" y=\"350.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"audit3\" id=\"BPMNShape_audit3\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"420.0\" y=\"330.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\" id=\"BPMNShape_sid-FE485B2D-9A23-4236-BD0D-D788CA6E30E4\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"555.0\" y=\"350.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"audit4\" id=\"BPMNShape_audit4\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"630.0\" y=\"330.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\" id=\"BPMNShape_sid-3F53B6BD-F8F3-496B-AC08-50630BD11477\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"765.0\" y=\"350.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"apply_end\" id=\"BPMNShape_apply_end\">\r\n        <omgdc:Bounds height=\"80.0\" width=\"100.0\" x=\"840.0\" y=\"330.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNShape bpmnElement=\"sid-5FED02D6-C388-48C6-870E-097DB2131EA0\" id=\"BPMNShape_sid-5FED02D6-C388-48C6-870E-097DB2131EA0\">\r\n        <omgdc:Bounds height=\"40.0\" width=\"40.0\" x=\"240.0\" y=\"45.0\"/>\r\n      </bpmndi:BPMNShape>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-3DBCD661-5720-4480-8156-748BE0275FEF\" id=\"BPMNEdge_sid-3DBCD661-5720-4480-8156-748BE0275FEF\">\r\n        <omgdi:waypoint x=\"520.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"555.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-44AFB9C1-4057-4C48-B1F2-1EC897A52CB7\" id=\"BPMNEdge_sid-44AFB9C1-4057-4C48-B1F2-1EC897A52CB7\">\r\n        <omgdi:waypoint x=\"280.0\" y=\"65.0\"/>\r\n        <omgdi:waypoint x=\"989.0\" y=\"65.0\"/>\r\n        <omgdi:waypoint x=\"989.0\" y=\"356.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-8448EF4A-B62E-4899-ABC2-0E2DB2AE6838\" id=\"BPMNEdge_sid-8448EF4A-B62E-4899-ABC2-0E2DB2AE6838\">\r\n        <omgdi:waypoint x=\"240.0\" y=\"65.0\"/>\r\n        <omgdi:waypoint x=\"153.0\" y=\"65.0\"/>\r\n        <omgdi:waypoint x=\"153.0\" y=\"231.5\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-A7589084-4623-4FEA-A774-00A70DDC1D20\" id=\"BPMNEdge_sid-A7589084-4623-4FEA-A774-00A70DDC1D20\">\r\n        <omgdi:waypoint x=\"385.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"420.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-35CC8C6C-1067-4398-991C-CCF955115965\" id=\"BPMNEdge_sid-35CC8C6C-1067-4398-991C-CCF955115965\">\r\n        <omgdi:waypoint x=\"785.0\" y=\"350.0\"/>\r\n        <omgdi:waypoint x=\"785.0\" y=\"164.0\"/>\r\n        <omgdi:waypoint x=\"311.0\" y=\"164.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-EF2F51BB-1D99-4F0B-ACF2-B6C1300A7D2B\" id=\"BPMNEdge_sid-EF2F51BB-1D99-4F0B-ACF2-B6C1300A7D2B\">\r\n        <omgdi:waypoint x=\"310.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"345.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-7D723190-1432-411D-A4A4-774225E54CD9\" id=\"BPMNEdge_sid-7D723190-1432-411D-A4A4-774225E54CD9\">\r\n        <omgdi:waypoint x=\"805.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"840.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-2AB7C01A-50EE-4AAC-8C8F-F6E1935B3DA7\" id=\"BPMNEdge_sid-2AB7C01A-50EE-4AAC-8C8F-F6E1935B3DA7\">\r\n        <omgdi:waypoint x=\"201.0\" y=\"260.0\"/>\r\n        <omgdi:waypoint x=\"240.0\" y=\"260.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-D44CAD43-0271-4920-A524-9B8533E52550\" id=\"BPMNEdge_sid-D44CAD43-0271-4920-A524-9B8533E52550\">\r\n        <omgdi:waypoint x=\"595.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"630.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-FA618636-3708-4D0C-8514-29A4BB8BC926\" id=\"BPMNEdge_sid-FA618636-3708-4D0C-8514-29A4BB8BC926\">\r\n        <omgdi:waypoint x=\"365.0\" y=\"350.0\"/>\r\n        <omgdi:waypoint x=\"365.0\" y=\"164.0\"/>\r\n        <omgdi:waypoint x=\"311.0\" y=\"164.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-02DB2AD9-1332-4198-AC8D-22A35169D15C\" id=\"BPMNEdge_sid-02DB2AD9-1332-4198-AC8D-22A35169D15C\">\r\n        <omgdi:waypoint x=\"730.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"765.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-36E50C8B-6C7C-4968-B02D-EBAA425BF4BE\" id=\"BPMNEdge_sid-36E50C8B-6C7C-4968-B02D-EBAA425BF4BE\">\r\n        <omgdi:waypoint x=\"60.0\" y=\"260.0\"/>\r\n        <omgdi:waypoint x=\"105.0\" y=\"260.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-53258502-43EE-4DE8-B1A4-DBD11922B8AF\" id=\"BPMNEdge_sid-53258502-43EE-4DE8-B1A4-DBD11922B8AF\">\r\n        <omgdi:waypoint x=\"260.0\" y=\"240.0\"/>\r\n        <omgdi:waypoint x=\"260.0\" y=\"193.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-163DBC60-DBC9-438B-971A-67738FB7715A\" id=\"BPMNEdge_sid-163DBC60-DBC9-438B-971A-67738FB7715A\">\r\n        <omgdi:waypoint x=\"260.0\" y=\"135.0\"/>\r\n        <omgdi:waypoint x=\"260.0\" y=\"85.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-BDB0AAB2-7E50-4D35-80EE-CE0BECDD9F57\" id=\"BPMNEdge_sid-BDB0AAB2-7E50-4D35-80EE-CE0BECDD9F57\">\r\n        <omgdi:waypoint x=\"940.0\" y=\"370.0\"/>\r\n        <omgdi:waypoint x=\"975.0\" y=\"370.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-1525BFF4-3E9D-4D8A-BF80-1F63AFE16289\" id=\"BPMNEdge_sid-1525BFF4-3E9D-4D8A-BF80-1F63AFE16289\">\r\n        <omgdi:waypoint x=\"575.0\" y=\"350.0\"/>\r\n        <omgdi:waypoint x=\"575.0\" y=\"164.0\"/>\r\n        <omgdi:waypoint x=\"311.0\" y=\"164.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n      <bpmndi:BPMNEdge bpmnElement=\"sid-72258A41-203E-428C-B71D-CA3506252D73\" id=\"BPMNEdge_sid-72258A41-203E-428C-B71D-CA3506252D73\">\r\n        <omgdi:waypoint x=\"260.0\" y=\"280.0\"/>\r\n        <omgdi:waypoint x=\"260.0\" y=\"330.0\"/>\r\n      </bpmndi:BPMNEdge>\r\n    </bpmndi:BPMNPlane>\r\n  </bpmndi:BPMNDiagram>\r\n</definitions>',0),('899c24530acd4ec8ac1aa159a045234b',1,'test_audit.png','d6403c84f1a743c1ab89e888519bd87d','�PNG\r\n\Z\n\0\0\0\rIHDR\0\0�\0\0|\0\0\0=ӳ�\0\0S�IDATx���|T����S����h�˲�l�e�ծZ1��4�X��K]��RVV�\"�Z/�\"\Z1�c\nĀ����D.I�c�1f��E��c��>�9�03�I2I��L^�����\\�\\2��>s>sΜ1\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0��/\0\0\0\0\0�+�,e�\0\0\0\0\0� ެ/�J����%\0\0\0\0�s�m�ɖ-ܟ�t\0\0\0\0�y�vk�\0\0\0\0�V$��T���n\0\0\0\0\0�l�[k���\r\0\0\0\0@��m�vz\0\0\0\0\0�m�=�����\0\0\0\0���κ=\0\0\0\0\0Q�����~\0\0\0\0\0��f��vgK7\0\0\0\0���=���̺����q 5\0\0\0\0@�o��x4���R�߶6݁nG�\r\0\0\0\0��Ͷ��j�UM�g�m�D���N7\0\0\0\0����k�[j��M��gz��\r\0\0\0\0�6�vBM�����Ͷo����\0\0\0\0���֦���;�f���?3��\r\0\0\0\0��f���n���G;�m��\0\0\0\0t�f������vG�\0\0\0\0\0a��[��5�i�}�n��\r\0\0\0\0],ά���6k�լ)�M����^v#�ݲ]e]�I���(��(*ʪάj�r�z�poh�E;�p��\Z���Ud��ƙu�Y}xyڤ������-�m���@��\r\0\0�h$}� ý���2[�:h�76���A��l5ڋͺ���C���3N�w���t�n\0\0\0t\'�J�ցg�r�+��o��o��d���`�(��/G)���(�\0\0\0�d�w�������\n�lg|��D6ݭ5����vk������\0\0@����w��yj�y>�jmskͶ�Φ�ޭ}�\0\0\0\04�zK�#�9@�|g���O�@[���l�tۏG�\r\0\0\0�����\'RCH���yB&�h�{��F�����8|g\0\0\0hN��$^��l��h�o�=���<���6Z�?�\0\0\0&G/���+�8����l#�|w/�fy��O}�ޮ���\r\0\0\0t[YgƉ��Ysx¦��(��\0\0\0hN��gxp\"�!�9�Vt4ݝݼ\0\0\0�L֛syp\"�48:y8��n��F\0\0\0G�V^�ˀI��>�a�t����\0\0\0��>���\'��%+���n�\0\0\0\0�`��&z���D���\0\0\0�C`����f:���?��\0\0\0��\0C�m�f7r\0\0\0�~0tr�M�\r\0\0\0���Nn��h�\0\0\0�!0�й�Y��\0\0\0��\0C\'ʲ�U/^\n\0\0\0�~0t�8�\\[�\0\0\0�!0�Щ2��$���\0\0\0�7�8�u�.�\0\0\0�����i���|�\0\0\0���o�]�xy\0\0\0\0�!0��>��m�\"^\0\0\0�~0����|�\0\0\0���J���\0\0\0�!0���\0\0\0X��+\0\0\0�ul�Ƽ\0\0\0�:6``^\0\0\0�c��\0\0\0�:6�\0c^\0\0\0`00�\0\0\0\0ֱ�\0�\n\0\0\0``�1�\0\0\0\0��\r�W\0\0\0\0��`��y\0\0\0��\r0��W\0\0\0\0X��+\0\0\0�ul0���\0\0\0X�`�+\0\0\0\0�c��\0\0\0�:6``^\0\0\0�c0�\0\0\0\0ֱ�\0�\n\0\0\0`00�\0\0\0\0ֱ�\n\0\0\0\0��`��y\0\0\0��\r�W\0\0\0\0��\0�y\0\0\0��\r0��W�\0\0\0\0��`��y\0\0\0��\r�W\0\0\0\0��\0�y\0\0\0�ul0���\0\0\0X��+\0\0\0�ul�Ƽ\0\0\0�:6``^\0\0\0�c��\0\0\0�:6�\0c^\0\0\0`00�\0\0\0\0ֱ�\0�\n\0\0\0``�1�\0\0\0\0��\r�W\0\0\0\0��`��y\0\0\0��\r0��W\0\0\0\0X�,���R�SRRfN�8qolllC�޽��:P�P={�������l���Ϳ#�\0\0\0��\0��-[v�ȑ#�cbbԜ9�U~~�jh������:���,**T��ϩ�6������_L�\0\0\0@?X�JM}e}�~�TR���j4��&*���H����SO=�&�\0\0\0�!0���پ��TQ�v�	��\nq�����}��Üc�\0\0\0��\0�˖-�G�lm3�?�W-]��\Z3&A�\Zu����k�\r�#U�f�Q����SN��`�r\0\0\0����R�G���>)�y��7^�b�R5��ԭ���5v̍*>�Z5t�j�n���:��ޫW�<b\0\0\0�!0�\"\\J�11?R.W���5zU¨x�h�p�H�~�����aW�Mwl��Ω��>�Ss��=\0\0\0���&N��wΜ\'�F��f5bx�za�|��V�Jy1Ioپj�P}��v���{;�c5mڽ;�Y�H�\0\0\0@?X��Ґ��c6z\r���\'���Tm��������T�>s����C�?S\'�o�����ջ��0g�N�\0\0\0�!0�\"X�޽UC��f�W߬���*.ڢvoU�w���;vlW�=����P/��q=\0\0\0�����R_6+���j֬�j�o&���BU��]�v�P���o5�����_���Tǋ\0\0\0��\0����Ϋ\Z?W�ֽ�bc��?�TN�ϫJK�Ր�/U��NU\r\r�5�=��b�\0\0\0�!0������S�}wL��!]\r\Z�j���{e�U��*��?���W��W^2��4�{��W^���W�o����>��6\0\0\0��\r�1��n٤k[�켼��͌t�h�X�D��x�Jz�Y�̼�����P]{����5^�Au�X�\0\0�~��h����c�~��D.����ź�����-P�\'�S�;�I���Q3g�V=�ģf���~7�~���:^,�\0\0\0@?XT4�_8%\r����ݬ�H{U7��|?;��;�	�ܳsu�-M���	js��V��Չł\r\0\0\0�C`�EE�}ԩ�{��G��~y�8�Pˮ��*.n�����zkwi�^�Au�X�\0\0�~��h�?�*�7S_~��J|�i�0�:5b��j��+TܕC�P�Ѿ������Qǎ�EO�{{��ł\r\0\0\0�C`�EE�}�\n�b�\0\0\0�!0������\n�b�\0\0\0�!0����>L�Y�`\0\0\0�`Q�p��\n�b�\0\0\0�!0����>D�Y�`\0\0\0�`Q�p�¬X�\0\0�~��h�PaVmwO��@<\0\0@?XX7��¬Zw�hm]��\0\0\0�C`��w�]�亅g����u��W�/+)��6���_ff�s:\'�u}��z[�۔�������z��K�Ϛ5��c͟?K�>th��uUU[��G��7{����f�UV��kj\n��\r��3�8������Zi�i�\0\0@?X�7ܟ���\r��eYY+�.���5y�̆�H�����;��r��sr��ٳ�JN��\\�n�ݧ���l6�o�3�<CO[]�U?��`n���\Z?�j[�i���v��+�z>ϕ+_pN�߿C����Wk�iyL��gϞ��}_��r~ʔ�tþ/����^�/��\'z�ѣ���Ͼ��G������s�E͘1�l��շ�����[�g���u\\(\0\0\0�~��m���-��LL|L��oٲ.�m�.���*6�����_��Ç�����yy�����*}^[ΟrJo�|�o6�w���J}��cX[��ԡC��˗,���KF��`���euu��oA�\Z�yH.�55�����[����Y�Xmذ��y��eg�R��Unn�~�r^�������?��w�9?PÆ]����|��/�zm�[�i�\0\0@?X�4�iVee�Ԟ=٪��c���ݡD���x������?�k��S99����9��N5��\nu��\'�;��lb�6��O����R����@����<O-\\���\\�w7�x�F���.W�*/߬/KM}N?VEş�u��җ��-R�_��y������ ���^�*����T�|�(�q�瓛�z��]����2����c�}yN׆F��(��(wՙ�Ǭl��1+ެ^���C`��Iý�Y-Y2O]tѿ�-[֨ի����n��=�A}^nSX����I��K^/e�-��-���=���c�^�����&%=��g���P��O�˦N�`}W�^���=}cc��&\\]]������Wx�\\�m�:=}v����f���z+��m��=[o��ˏ-Sk֤����U|�}�O~2H�}��oy.��\\nߗL\'���P�\\2�l�W{=�\\���X����5�sw��5Ƭ���5�YIf�c��#i��#��#�~��j�?iVr�]w�R�NK[��B{^������.�0�j��_W_���]���~d���.+�v�����Ի\\��_�<�4��ٖ�U��U�^������+ӧ�η�Lo�\Z�~�?�8zt��}���|mm����iW�Nҧ��\\&���7^�O.[��I�h74|��O����X윗\r��j�����f��g>�\Z��7��AVt�a��;G�f}a�L^��#�~��n���Y��۝�ӧ��u]f��~o\'u���}q���v#+�rWW��v�\\���_�/^,����(V��̦�bUS�nV*��ý�ld?V))������oذT7��&ݦ�n�����J�y��\nש�.�P7��&<�j�6{}Ǝ�^�zk��,o���#�Tv�\n�h�zM�n��_���G�YY�~_�\0��w�w��-\r��a�Y��ڝ�rý�,9x?��\0�̆��Y�\'��P���[JK7��5fC[m6����Ʈ�\r���kk����Z?����l����j����v7�ǟKr򓺡ݷo�n�������y�.�if��l�?���>��8v��y^r��>`Z��Hg[������Oy\\�~�w�B�V�_�`�3�\\��nu�e��fϞ�/������^���[�o��p&ߟ˲Vr\0�O+G��Ix?��\0�Ć�c�u�H���]�������\r\r��ÇK�M7��2e��<���ڞ{n}Z*--�:�z}CWz��,��ZC%�#��������Æ��l�SUFF�JM}F?�}�܇�w�^�u���?��µ�	��4�V]r?�&8�l��M����}�������[�x���{��kc��=c6�����{�u�P��7o����{���Vjժ��QCS^�1}�?�Vrd���k�eK�#�\0�G\0�`�pW{UN�\nݼ����t�lv��fڴ�������M�\Z?������>��j8_�w�|�|II�>�r}h�;K�oj�r�)(x��6<����<����u���}��|w��&O�����;��c�?0��������m�����ת[o����ۗWTd����B7���z�����1&��}jp�\Z��9����C`�E\\��QDUSӇ�2M��K{���q\'�IbqtH29x?��\0�����\n���q\'G��#��T����S��!f��N�;��\"萭����,�\Z�J*�*J���{W>\0�7���C`�ET��f��n���i#\0�Q./��@?X�4�T�U��;9:�)@�sT��\0�~��1\r��T�U��;�-�:)\09�@?t����\n���q� G\09�Н\Z���0+\Zn\0� G\0y,*\Z�2*̊�\09�@^�\0���{/fE�\r�� /`�EEý�\n���@�\0r�0�����M�Y�p G\09�`��O�����l�vQaR_}U�Ϝ5.��� /`�E���|(?���RaR��?��9kv�\'\0� G\0y,�]u�e��̙J�F5v�Ui�I$O\0�@�\0�X0����˵�f7<�=zT��&�< G\09�`���&%=H�5f�UK�Y�K�\0�#����0��3O�/*ZA�ۅ���t�9/�u1y@�\0r�0��G�9��w��k�{��Qc·1�	\09�@^�\0�¦����l޼�>�;ݡ�ζ���n�l���@�\0�t�6�g���~����L�e��M/lh(�1������䧿�h����;��\'\0� G\0y�{�Ԭ9fm5��z��)����m��8��� /`�!�eY�/y�\0r�0��9d+�˚W	��	 G\0�@^�\0C��4�﮽���<�\09�`�!���v��e!O\09@�\0�:&�h~P2���w��@�\0�#����v�uۮq�<�	 G\0�@^�\0C�d�z����<�\09�`^K[��.7y�\0r�0��NY�4���<�\09�``^1�\0�#��00��<�@�\0�0��W`�\09�``^1�\0�#��00��<�@�\0�0��W`�\09�``^1�\0�#��00��<�@�\0�0��W`� G\0�``^1�\0�#��00��<�@�\0�0��W`� G\0�``^1�\0�#��00��<�@�\0�0��W`� G\0�``^1�\0r��00��<�@�\0�0��W`� G\0�N�,k@�T;y�X�y�#����\\�4�cx�X�y�#��^v�v�Y�x�X�y�#��ސ\Z�q�<,�<�@�\0�����r�w�ٺ��\0�#�� /@��.7��fa\0�@�\0r��d\Zl�fa\0�@�\0r����y4�	�,�<�@�\0�t���l�fa\0�@�\0r��\ra��0\0� G\09�\"g�)�;%%e�ĉ����6���;��pQ-TϞ=�;���?>|�F��HF�@�\0�#��tc˖-�g�ȑ�111jΜ�*??O54|e���QA��nEE�*1�95p�������5_�Y�y�#\0� /�Lj�+���맒�^P.W��46Q�X�ɋT�>}�:��Soba\0�@�\0�#��t�f��.PEE����[�Uyy��۷�?�����,�G\09@�\0�ҽ,[��ٲ]T��l\n]^�t�Kj̘5j�����Q7ďTɋ��MG������SN9����^�y�#\0� /�h�(�{��kꓒ�7O~�U+�/U�>J�z�X]c�ܨ��UC�^�������8��^�z�0\0� G\0�@^�TJ�11?R.W��6zU¨x�h�p�H�~�����aW�Mwl�������Ԝq,�<�\0r��(4qℽs�<i6�_7����櫬�2TʋIz��U#���������Qm�i���i΂D`�\09�K��Ґ��c6�\r���\'���Tm��������T�>s����C�?S\'�o�����ջ��0g�N`�\09�K�ݻ�jh��l\0��c�R�E[Ԏ�j��]rzǎ����{��%��9\\�d�%X�R� G\0�@^��R��f�r�]͚5SM��$URR���ۣk׮j�}��f<x������ޖj{u��ě%GeO���!v,�r�䥛4�u^����Z��5�SU�Q�zp�}^UZZ��\\~�z}u�jh����W7H�O�-[�?��f�\r�#\0� /ݤ���S�}wL��!]\r\Z�j���{e�U��*��?���W��W^2��4�{��W^���W�o����>��W�ķ�n�r���\0r��hk��9�u�&�[��d��mVof��F{��%��ŋT�Ϫg�=��������kF��o�����Ih�����;�,�r�Q��f�g�Z��ͪ��p�Y���i�Lk�(n����c�~��D.����ź�����-P�\'�S�;�I���Q3g�V=�ģf���~7�~����^Q����f�-�,�r�Q��qf�ZM�+f�f� �N����1V#�dM�oք�l��pJ\Zn�	��o�Y����n���~v�5w��g��[��1��朷�����o(�Fp[�����\0� G\0�4/�Dg�Un5ӽ���4��[ͺ �\Z�N�ݻM=�������Zv%�WqqCԯ\'��[�KK�����eo(��b-����f�\r�#\0��ܼ�7���E�W��>�~�ek���}�U�o�����S����*a�uj��+�СW��+���f�}�����ߣ�������T�+��P:�{8�����\0rDh^d%^���I�w�u����>BuQE�JkH����� /!2�j�c:�~c����-�f���Eo(�}�q�t���#\0����HS,�ǝ���Ժ�A��p���\"�\r���g�3�N�o0|oǁ�X��@�\0D@^�H�3O�c�w��Fv��7��*��P|�DK������t�M7+8\09��0΋�����wk�������!��*B�P���}���� �n�fۮ���nVp\0r�#\0a�����K�[���� �E�o(��`�sKM���S�L�w�Y��@�\0�Y^���\n�cV�`��~�0�m\r������ֱ��N����t����m�ٽ���@�E�W�8ď�h�����+���k���k�J�#3s�s:\'\'M�����6���={6����^��yޮ}�v��O>�M�c����]�f���gg�Vg�yF��甔y��څ��hO��Z�l�����l�f G\09��yYk�m!~Li�°�+��U�l�j���={���9f3\\��?1�q�4��8���Z��ަ��V:�e��U�1�0�}Z.��-�eZ�\'םrJ���С=z��Y�g������^4���U]����;V��~+*�TMM����[�&O��3}qq����p��lҤ_��8qq?է�6lX��;�ܠ_�.n�[��v[��@Mw�v6�6���\n@�\0r �\"�w_�ǌ1��0n�=�j��n�?mw��g̘�ޫ�8�K���������#}^\Zr�i��Z�Ǝ�AM��f����z��z���?��WJ���_��ǲo3q�mzZ�����ii�׫k����{�y��x���ȑ�԰aC�����~ކ�Z����X�^�f�s��]nk����{���m�^�0�i�[j��:�lw����� /��ά�C���x\r�p{nՌs7������5����Ym6�s�i��j6��F�;Ʃ�ҍ��i�3���2m]]�JOOQ��.|Z_.��_����]x�Ul���<���שI�n7�j��yz�4��er�ii��m���e�����,�l��O���^�<gy�r���Z����z�.�n���隚m��o��f\r�����eMwG�mߦ��t���#���TEb)��v�ܶ�*_��7�!���k��C_/�=�MJzB�]W��JN��/�:����Y����=���u����_����4�YY��������?{��\'��[�o�}�ڲe���~W��С]�s��X��?��-R��[[���ٯ��h�k���L�n�[����;\"ɺ�>,cY��@�\0�Zl��@�4�[,�#���߾����R]~�Ŏv���;�I�.+��4�g�u�:��&Xn#�_r�`UP�G��~Z���[�W�zA_�o�v��8۶�S�\'�W������R�8˗\'�i]���=7������2���**r�����2���D�Ǐ�&#�e��#F\\������lݾ��QA���}���h��iiw[~�;�p���#��¼��֛)�x��I�U\\�i6�K�}�^���@UW8����]�L/�/���+ԁ;Tzz�n�kj��;��popn����s��ctC������&M��l�����e�3N�f߾m���}T�U*//�j��9�m���Wzݷ�?��o��ii����u��;�ذ��:��|��=M7��f G\09��y�(�Ǜ�\"�����l��/読-T˗?�c����f;_�{���zws��3��ON~J9��lj��\r�\"}Ycc�utr���o�}��\rw��K����яa��q^�lZ��kj\n��å��몪�q�������6���Ч��=K͘1�]�c7ܭ�\r�&��[��������ts�rVp\0r�#\0a�~��孖>\rwM�e��jZMj�JIq����ڹ��p�~�0��e*#�%������ܾN�C�fe����7���.�G֮໛=/�ǵ/�w����[[��X�ߦ��\\.����m�����=���������t����;ۭ�Nw C~����@X�e�Y��Pt����3H������J��Pa6�Ku�t�p�����ڙ���.�:_R�>�r��,�����75}�LSP�f6�������}P%&>b6�睊S�SM�6Q��*,\\�N;�u��^��f8��ߪk��T�����QW��u�����~.�a����[��j�<�����D�XimskͶ�Φ�ޭ}�SVp\0r�#\0ᑗ\\#t[ä!�\Z�3H��WSSUD��z�|C	�����v�M��x4۬�\0� G\0�(/��^n�f+��;!r.�}C�-ݾ�w�i�;����>��w�Y��@�\0�i^���j���V#���wr�]EuQE���O�y6�mi��Vn�O���#��ĘuЬ�t��Z�?(�g�RR]T���{�4������v��o���#��%D���Ŝ�f^�wB�� �*�.�(xC�������:X��@�\0�q^&Y�qgm�Ժ�G�a)��E%o(��twv�Vp\0r�#����l�-g��|�Z��}�j�b)UAuQE�JGwg7r�\09@���K������v���ַ\"�}��A�4��z�ꢊ�7��U�����\0rDQ^n�\Zo�-|���	��:ݺ�t�9� Ѭj�ўdD���[h�˩.�(|C	v�pv#g�\r�#\0��Ҽ0���Z�w�����fe�]�c�y)��E�o(mm���Ug}��\09@�\0��\rw�E�I������f�6@�\0�#��Dyý�ꢊ����n�,�r�䥻4�{�.�n��f�6@�\0�#��t\'�|�w\r\r�f�\nq}�U�>s���0���$�m�\09@�\0��m��C��K�p�Z�����Y����ka�O���\0r���᪫.[7g�T�,�B\\c�^�f�v���G\09@�\0�m�A��|�r�	m}ңG�\nsı0\0� G\0�@^�T��?,MJz�&8�5f�UK͗>���G\09@�\0���y�i�EE+h�CP��Kכ��A�.fa\0�@�\0�#��D��s�9��4�\'���ѣG��=���y�#\0� /ݷ�>���7���Nw�g�ڍ���}��� G\0�@^��A={~/���O=<e�-�7mz�`CC!\rs;ꫯ��[�����h����;��0\0� G\0�@^��K͚c�V�\Z�IW.��;���_q)�#� G\0y�y�� /\0X�y�#��\00�\0r��\0�\0r�#��\0`a\0�@�\0r�\0,�<�\0r�\0,�G\0�@�\0����G\09�@^\0�0\0� G\0�@^\0�0` G\09�\0`� G\0y��\0�#� G\0y�y�� /\0X�y�#��\00�\0r�#\0�\0�\0r�#��\0`a\0�@�\0r�\0,�<�@�\0�\0,�G\0�@�\0����G\09�@^\0�0\0� G\09@^\0�0`�\09�\0`� G\0y��\0�#��\0y�y�#\0� /\0X0�x	\0r�#��\0`a\0�@�\0r�\0`a�<�\0r�\0,�G\0�@�\0����G\09�@^\0�0\0� G\0�@^\0�[���j\'/l� G\0y�!f�Zi���2���\0r�\0��n��.2�/l� G\0y�!-4��xyX`�\09�����]n��6[�Y`�\09����]n��� G\0�@^\0t�L���,�r��@���h�x9X`�\09���c����,�r��@\'\Z�6@�\0�#��\0�*�z���̜8q����؆޽{��-*��ٳ�w��gÇ�h���Q��#rD��9\"/@7�lٲ{F�Y��̙����TC�W��;��%�cQQ�JL|N\r8����{͗�bVp�E��9\"G��#�D���W����O%%��\\�Fsa�D��JN^�����թ��z+8�\"G��#rD��y�x�|������B�[*DU^^������{�~�\"G9\"G��#rD��Э,[�����h���py�ҥ/�1cԨQ׫믿F�?R%/Jj6��*/߫N9�/��ߝO�#rD��9\"G��#�tr ��#��OJz�<��W�X�T���(u�-cu�s����V\rz�Z���P�T���?�իW+8�\"G��#rD��y�DJ�11?R.W���h���Q�z�|�\r#���ϮSÇ]i.�c�MOu��>��O�Y�\n9��9\"G��#rD^�(0qℽs�<i.�nV#�ǩ�WYoe����\'�W��/��.ח~oG���M�w�9KY�!G9\"G��#rD��bc�4�����fu�����~��nyGe�i�Z�j�Z��F}\\������շ�~��vT���ws��d\'+8�\"G��#rD��y�@�޽UC��悡�Y=6�!U\\�E�(ުv�*�%�w�خ{�!����_2�Y�b�Q��#rD��9\"/@���(�e�r���f͚���f�*))T���ѵk�5��V3�O}���~oK���|���9\"G��#rD��y�Y�]�U����u�^S��?U�U����U���j�嗪�W����Ϛݞj��C�(rD��9\"G�� ���p��6��aCcUMu�z�l��ݼQe��G���J���K�B;M�t啗�����o�����\n9��9\"G��#rD^��Z0sj�M�7ea���Y�����+�/Q//^��^xV=3�i}���/-T�^3Bm|{��}P�/Vp�E��9\"G��#�DՂ��N=6�w����\0^��Xג��U����y��>����#j�ߪ\'�x�\\(g��ͼ��>��+8�\"G��#rD��y�j���S�`��������i���,���?G͝�z�ٹz�,�1��朷��T\'+8�\"G��#rD��y�j�|ԩ�{��G��~y�8���]��U\\���	�������z���b�Q��#rD��9�\"Y�sn�v\Z\0�]0�U�o�����S����*a�uj��+�СW��+����������G;�=����+8�\"G��#rD��Qb�;���{���&�\n9��9��9\"G�e��l�Ջ�	z��&�\n9��9��9\"G�\ri��G��k�|�\n��╀�K G9\"G��#rD���r�w�ٺ\r�o��7*L*JWp���¬$��rD�#rD��9\"G�(l��.7��ڿ`>D�IE�\nN��J�lQ�,\nڌ_rD��9\"G䈊�e\Zl�:k�|�\n�����\0[�p���#rD��9��)Gq\rw�~Ղ�\0&E+8	�����\'�#��#rD��9\"Ga��.7[���-��J�IE�\nN[W^�i���#rD��9�\"=G̺Ϭ�fU�Uo�\rf}b�w3�iM���Z*L*\nVp��R���\"G�\"G����%?��k5֪��o�Z)�M�O�0�_�i��]]���0~�9\"G��#*�rcVvM���j��T@���T�T��ttw�Hߝ��K��9\"G�Q�����H��ͳ�j�\'�u�Y}�i��5Ⱥ��n�%\\>�bk7x��*L*BWpZ; M���#rD�(rD�(r���w��t��������}�{2��w���\n�����>�k�nY`��#rD��9\"GT$�h�O�\\i��f��ܮܧ�fK7�|��I�K�߶m�����>}�����奩#��ɓ�CM�t�Wmܸ\\ee-S-=�\\7mڝm~^�W\'���;7��55������@׆\r����s�߷o���%%TYY�>-?jVr�͞����9���*�~}#h��`�{f�i�\r���\"��5����:�E���9�1�w#��_���}��湆���h�\0�����JK��A���Qze_N�{���3�<C-\\��3����<o߿�?�k��ӧ�TK�-��t�\rm~n���P]}ul��Hc �TW�����n6,����^��~o�\'ޢ�l���F�?����;~�rs_�Ӗ����/X�^.��X�.��B}�}����/���s���O�e�d�������v���C��9\na��_�QQ�#�Ƹ��mϦ�ܧ�p|�\\�j;V�t��;����̗��={���w7\n?�,=}��R��\\i�b6\n��[���\"��MM��>�:�����#��G��V����KJ2u3Q\\��.�����{��W����׿�L�r}���e2�<�Çw���g�i�����5k�UL�\0�6r�����m��ߦ�������:���#p�ư�x�NԖ�ϕ�&z\\Iߡ#G��(GTh��#*�r4�����ŝ|�޻��k9p|��q�UW��\Z0����Z�N9��z��{Un�:L�&ݪO�{n����{���^�F��JM�2�\\YN�ӟv�)fðPUW��=vS�{7Si6ZzN���ر�9�e��i�y�fz�i�zk�}�>���R���#GJ�i+*6��jk���������h��F�����w�u����ѧ+��}�ܻ��sh���@+�VVZZ��7}���#�;t����\n]�#rDE]�<�n\'���x�`+7�o�\\�b�Օ�7�������o�Sa�\ZU^�Q�w�����-s��yy�Y������@��g�[֖�ș����\'%ӧ���9�a��*&�_��)j�������K�ٳp�+.^�o/[�<��w��l64���V�Y����=--ɹy}bc�]M�6�l2���4����Yg�i6;�m�ױ��#D�X�Ib���JN[Wn|Wr�bw���V����\n]�#rDEU�Ƿ>���\'����\'�bh�\0�`��M����:��tðj�szW҇�������_{Zw�p�>�o_��$��46V�@�-��}���V�nj����e�e�&�2ْ8b��^�ee-ѻ�N��_jҤ[t���fd���y:T�ܷ���@n#M���I�\\���������7����ȑ��X�[�_B�`�G�qm�M[W2Z[�	v����?�-m}��9\"G!�u��#*�rt��tY\'����x���Z�^0W�XlS��+Ե�ƪo�Z��;��y�TS����LΗ��ӷ����lke�Roɒ����W�[�������rz��GZ|~2���3�]v��	^�mܸT�Ծ�ꫯpNoذؙn��=�\\����[U����V9�;1�!����ܦ�~���~}������T�q23SZ�_B�`�+��OF�ݍ.�JN�v���n��JN[_+rD��Qr�9��m{�Ɇ���t2��C�ɓow> :�A�R�������nѷ�|<ɩ��(/[_�r}����8U]�Yh���!��y^2PS���\'[}m~�7�i���ٳ>�טEw��2�孜��Y�O��tɃ�3�}̾���Y��	���� e�9����%���y����S����O=�S��-[^WӦ�Z��=�Z�q��ȳ	�t����6�@�4��XMM�+�yY�-t7�t���m~i\n.����;z��\\`�h�^z�����\\�{l�l��_9竪6y4�Gv;���w?�V=�u��X��\'���z�\n�+�n?l�e�B6C_�����~>���������On�r������lY�/��yy���Zwт���\\�ii%��+7}>\'��\"G�� GR2f}��̦y�u���ԧ�G�̙��^\"�o/{V�?�\n�!{�c����̀�=��T}��d�:v�Թ����)V��/�LH�/������)S~�d�^V�ʿ�_�&ݬ��^\'qq���R6�d}����\\9�9�f���nK����Q����������s>�O��g�1�>�Ƈ�����>��=�\'L�����Z��7�ͯ�1j�7���5�y^�Ϟ�[��Aɋ��}ʰ���!]����Ӳ�\r��\'��W�o���W�^6���m{_�0�Q������3��>��􂹲MU]������m����B텤�45U8ӺWr��m��o���)��6��~��q7lH���|�����\\.�ᬳ�?���#E����^e�����y.���\nG�nt����}�����칤�=�Zu��N������i�^�&%=��oh�km���&S`�i�c�<c6U����]�`��d4�>����ӑ�ߕ��0z��9\"G!ȑ=�d{�oY	��2`��d�YƗ�)�1�z�sz\\�tr�B�{����͛�5�dѾ���>?�O�s���c��r�iY�_y��X[��%k�m%s���s���P��~�^�ع��8����jtr����ܨ���,��Q���6�g��/�̖�26导\'�u����G9/����cGz5�vfKJ�����%K�V^�#=N,x�:F�.�$W9�CƬ���>���j٢�!�m��]�[�r������:�r{����sb��ط���&c�+��}O�����X\r�Z�^0�b������S�;�m����22�9/+\n�\n�}^V��O�S7�%��W�e�Ç�镆�´��A�s�|���z��SO��l��ҵ�\'�����oP۶��[�,x��={�t�X<�����Rsee�����w���^��ۗK54�\rD�>���L�5�wO��\Z�Ն�f�+��㫇�-	U���n�9\"G����H�р�d�Կd��=F���4Ş�q��\Z5j����q��z��>�܏d���7������9\r��!?T_����O�_y�C��6��<\Zˬ�g<�p\'�-𞙐9R�˽5o�>-9����e\Z��|�f/+���ݤ����~�R���\0��yE���^��c�J�=w�1F�?45��l�ȴ�Qϲ����-�k�f���62��v�����RS��Ǫ����Iv��&�����ͼ}{�~�GN{��~��R��lL���7�/~�y���<�}������~< �����]��Z�.�$t�����5]kG������.j8oQ�}��9\"G\'8Guu;�ߍ��Z\Z�}�r���͕����x��x��>������\n��ݫ|777�j�+Z��\n�t�sؿ�k��G�i��2�-v+�cef��:/_>�l8�\Z��V����Ho�4��k<K�a?W�9������o�K�c?vi�\Z���.L�x?jӼ���h��g\\�������II��d,\'\'?f}�i��]�)z7u{z{��l��dڳ���j=��s�p����L�m�C�a�.�z�����󹺛��˔������z�^��������3�y�~?�c7Х\r��T�T-�}߬}W&�����t�w��V�_rD�B���֑̅�_R�V=c���P?|�>�>��Kδg�y��$_�O�۷�i��i\Z�(����}��\n���c��뮛��>��^�=Zh�6[l����-��}ڕ���\\y�o6>��w7�������m�^k6��?u���ɷ����_�LW\\��&L�4#��o����9\"G���T]~��9cMƿ�.+{�K���9眭����3NdO-s�ɳ��S�G_��i�ݲ7;e����֖�uVS��߱g�[;c�yi���fO�z�|���Ը�Pˇ\0˗��_SZ��I�q[z<C�R��ܯ��ƕ\r�G|��چ�<�����s��nG�ӯY��9�ظ�:�ҫ��.%�V��*����Y�%�K�Ef��bӑO��Ԋ�����ӕG�m���1���XgBN=�=�t����bN<���<����2�JԆ\r������UFF�3���^�n�q�����g�Ӿ�\r�ܑ��̑�ai��)��Νfm��_M�r��,����oc7ܕ�oY�-3���><ǝ���־�W�����ͼ�3����[��������\'�+��j֬�8�%+�G�l5����Ƨܷ�?r��=v�H_�;��(�h����*��=�˵�Yn�����s���~䯊�_w>�1,�rWWo���kL��d����\'cW� M����{k8���\'�\r�X�������I�n�e���\r\r�����\nW�ol۶�j��[�|���`���[�7��r���9c_��w����s��F�Ο?�����hy?�(�@�6�JJ��&y�Z�`��}���J���|s%~����d-����\\����>�r��Hț����f.�S��v��t3.���i)Y`�w9��oY�+��M�лC��9-ׅ��	т��-�$���5m�wQbt�����_U�e5�/;㡴4��t��;��˸����*-�Y�\"#Y���[�\n��$&>�?���O�e2�)��s�-���o���?ֹ#Gљ����z�o��7�֑�G:��-i�%��o�\r�6�Q��u��I����]��q��Y�?�A���t7\r�f�����~L{zόUTd���1(�m��G�l��#�s�ǲ�*���H��;�%��t�\'ߢO���G͘q���r�\\��O��k�]e߱v�\"G�����?��1C�L�z���[>ܲǅ��w��ȑ-zN��2;[r{C�u��lj78�p�W?��س�Θ</{QƱ�������G���l�߳��Iɠ����ڙ�S�F����\rtm�]�:|�@��76��rҟc}j��^��+���~G��k�LŃ~����~�s�}D��Ӻ��:E�nh(QYY��6s��g���������Դ\'$����h���Vn�v��ػ��������9/[�������m��/ԧ��.,\\e�Hqn�^��u���^+��I�;�\'�՗ٗK�`�FV�d�Ai:�oyx�Z�ʲ�l��#Gѝ#�x�1{��>\"��sܸ�p_�?t��y�}�~��G�nu��é�o�Y�qe?����uw[�$yq7ǧu7�e�����޲eE��]��ƶ�����Ƿjɸ��s�2��6���w�#ޏ�w{l�x��C��ǹ^Ɨ���j�2�SS����fF������(�_w��s]��3���L��eek�_�Hu��l�1���~�;�ƨ�.�u����{��r�����\Z�L\'��л��\Z��G�rY��e�?���m��{���{CZ�¬�2��t��d[[����f��y�b�wC�s!�N7�vs�r�}���mݠ���c��:/�!o�����6a>^mYh��M�+9�㍋��;i7��|Ĉ˼.��v��̕�_蕓ŋ�[�g̘�\\f�-=��GY�\ZsE�sf������Y�b=��i��9�![4|W��i��-��p�9����n�ͳ�C(�e2�/��_���>a�_��ek���t6<Kn�a���Ǖ��i�~�)w~���d���q���_�+u�՗7{_��H 9�i$��(��\r�D��.	8���S�Fr�����9?~ݨQ��c�%_������,���^���W�ƅ�{������i�k��~c�_��,�͂3���^q�kN�|�+�\'r?��ؙV��r�i�=s\"������+Dꩧ�q޿쪨x�y��p�C��(x?���\'�1��x���Y��`����ۮ�DL�6^/e��oߟTj�z!w�H���k��^��z��z\ZC�f��^IZ��q��8]_����Z��y��hl,�>�}A�����a?��\\�����Ȋ�l-,.^e��,��c?�3�e�ww�;�����J�� �`DM�rs_6W���۪Usu�;cƯ͕e��`i�l�d��l�iu7���2�%��e�r��a��?�*/_�l�WU�w�}YI�����D��ڽ`OX�u�55�\n�2��+��/9��G�������,G�<Ʒl��샧]lߊ.5�6p̻CV.�Ns��s���us!Wj�~���L�[����u;�\'�����FkW����nd��E���n֧�I���^Ӯ^=�����1xQ߿}{����14��9�W��-�++mY�1Z�](j�KsTW�M�{���\rI���QU�i6�;������y����FX�5]m�&�_���7������z��x����<>�L�E�n˖ea�;r��rD�~D��9j�|����輟��+7��n�2\0��]!��z�o#�x�p�)x�j&޴v�K��o\"�����x�9=u�m�������\"}Z�}D���._���}o޼�����\"��<������rrC��D�\n��J�����F�?��{����jD����m�}��n��@�p��؋ԤIc�8�1{����&��o[߁]�wCN�J��/��_������s�2���#t�~��6w�Q��#��c��\n�l�;�tK����`-�`.\rY56y4��ֵuցd^q�𼼗�nw��.UG��<s�)\'�\rɖf�a�#�ƚ+��-m��i�]\'8����I�\\;�Ͼ�455��ϖ�����!Z��\'�Vp���tƖ��8�kX��ȑw�,��mۖY�������4�,��^-jv��V�V+W>�����\n\n��\r��A�LUWg6�y��o��=�K��Q����9b�����vy��-[�ۻ{���s�6��]�`nhp�\\��j���\n�{�[�nrr^�������q�f$#�9\'�l\n����ima8a�ϝ�\'GT���x�:���`%��W�\"*Gv6��穦�}��`ذoq�H��{YVVR�i���z^��h;;�;C�Ν��1,��uC�&���4��2w�������#r�&�|�n9-R�����t��܇�#�V@�4ܲUK�{n���m����M�����������o\Zy�����Eo}��\"�-���co	��nw���^�娴�5��j{���Y��r>�ji�ػ��w�^h횝�wz��JK��#��$2��6)�A�\0kl�8��ܑ��#��#rD��QP�[c]�4�YVC.[����e��A�m�0ܻ�{ޮκ\r��`��vt\Z�A���E �H69\n��N�#G�\"G�\"Gmcx��=���;�\0f�!�nx���9\"G��#rD��h��mV��\n�ўdp4r�3�]�b�wA\ZG�(rD��9\"G�u�f=`�Z�>1����阮{w�{�8\0�,��P�������E��\r9\"G��#rD��h�\0�,�#h�B��G��9\"G��#��\0f�a���+7��#rD��9�h��`f�ܥ+9IQ�rC��9\"G��#��\0f�]&����E��9\"G��#\04���ՇQ��#rD��9@�M�`9\"G G��\"G\0X0�`9��9���9���b�L�(rrD�@��\0�f�#rrD�@�(r�3f�#rD��E��E�\0�`�X0�#���#�#r�3ł���#�#�`�̂��Q�Q�\0f�39������.\'�|�w\r\r�,à��j�>s����\"G�\"G G�@<�Ǉ��`�Z�����Y��QI�(rD�(rrD�\0D����lݜ9SY0�A�{U�9K��\"G�\"G G�@0����˵��c��\'=z��0gI��Q�1���9%���aiR҃,��ƌ�j�9+r��\"G��#�#r �:���ꋊV�����_�ޜͺ��H�(rD��99\"G\0�O�9��wΡ_(��ѣ�|��0�E�@���9��N���y����������X�d�L�(rrD�@����aPϞ��9��SO�r��M�^<��9v��1�OD�Q+�i�w{�݈Q����#\0�̥f�1k�Y\rf)���2ܿ�(?�Q+�E�@���9\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0����9���6BX\0\0\0\0IEND�B`�',0);
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
INSERT INTO `act_re_procdef` VALUES ('test_audit:1:15a6f274462541768f885bc1e2282724',1,'http://www.activiti.org/test','流程审批测试流程','test_audit',1,'d6403c84f1a743c1ab89e888519bd87d','test_audit.bpmn20.xml','test_audit.png',NULL,1,1,'',1);
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
  `id` varchar(64) NOT NULL COMMENT '编号',
  `category_id` varchar(64) NOT NULL COMMENT '栏目编号',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `link` varchar(255) DEFAULT NULL COMMENT '文章链接',
  `color` varchar(50) DEFAULT NULL COMMENT '标题颜色',
  `image` varchar(255) DEFAULT NULL COMMENT '文章图片',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `description` varchar(255) DEFAULT NULL COMMENT '描述、摘要',
  `weight` int(11) DEFAULT '0' COMMENT '权重，越大越靠前',
  `weight_date` datetime DEFAULT NULL COMMENT '权重期限',
  `hits` int(11) DEFAULT '0' COMMENT '点击数',
  `posid` varchar(10) DEFAULT NULL COMMENT '推荐位，多选',
  `custom_content_view` varchar(255) DEFAULT NULL COMMENT '自定义内容视图',
  `view_config` text COMMENT '视图配置',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_article_create_by` (`create_by`),
  KEY `cms_article_title` (`title`),
  KEY `cms_article_keywords` (`keywords`),
  KEY `cms_article_del_flag` (`del_flag`),
  KEY `cms_article_weight` (`weight`),
  KEY `cms_article_update_date` (`update_date`),
  KEY `cms_article_category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_article`
--

LOCK TABLES `cms_article` WRITE;
/*!40000 ALTER TABLE `cms_article` DISABLE KEYS */;
INSERT INTO `cms_article` VALUES ('1','3','文章标题标题标题标题',NULL,'green',NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('10','4','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('11','5','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('12','5','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('13','5','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('14','7','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('15','7','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('16','7','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('17','7','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('18','8','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('19','8','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','3','文章标题标题标题标题',NULL,'red',NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('20','8','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('21','8','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('22','9','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('23','9','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('24','9','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('25','9','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('26','9','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('27','11','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('28','11','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('29','11','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','3','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('30','11','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('31','11','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('32','12','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('33','12','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('34','12','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('35','12','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('36','12','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('37','13','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('38','13','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('39','13','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4','3','文章标题标题标题标题',NULL,'green',NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('40','13','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('41','14','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('42','14','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('43','14','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('44','14','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('45','14','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('46','15','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('47','15','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('48','15','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('49','16','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('5','3','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('50','17','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('51','17','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('52','26','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('53','26','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6','3','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('7','4','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('8','4','文章标题标题标题标题',NULL,'blue',NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('9','4','文章标题标题标题标题',NULL,NULL,NULL,'关键字1,关键字2',NULL,0,NULL,0,NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');
/*!40000 ALTER TABLE `cms_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_article_data`
--

DROP TABLE IF EXISTS `cms_article_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_article_data` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `content` text COMMENT '文章内容',
  `copyfrom` varchar(255) DEFAULT NULL COMMENT '文章来源',
  `relation` varchar(255) DEFAULT NULL COMMENT '相关文章',
  `allow_comment` char(1) DEFAULT NULL COMMENT '是否允许评论',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章详表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_article_data`
--

LOCK TABLES `cms_article_data` WRITE;
/*!40000 ALTER TABLE `cms_article_data` DISABLE KEYS */;
INSERT INTO `cms_article_data` VALUES ('1','文章内容内容内容内容','来源','1,2,3','1'),('10','文章内容内容内容内容','来源','1,2,3','1'),('11','文章内容内容内容内容','来源','1,2,3','1'),('12','文章内容内容内容内容','来源','1,2,3','1'),('13','文章内容内容内容内容','来源','1,2,3','1'),('14','文章内容内容内容内容','来源','1,2,3','1'),('15','文章内容内容内容内容','来源','1,2,3','1'),('16','文章内容内容内容内容','来源','1,2,3','1'),('17','文章内容内容内容内容','来源','1,2,3','1'),('18','文章内容内容内容内容','来源','1,2,3','1'),('19','文章内容内容内容内容','来源','1,2,3','1'),('2','文章内容内容内容内容','来源','1,2,3','1'),('20','文章内容内容内容内容','来源','1,2,3','1'),('21','文章内容内容内容内容','来源','1,2,3','1'),('22','文章内容内容内容内容','来源','1,2,3','1'),('23','文章内容内容内容内容','来源','1,2,3','1'),('24','文章内容内容内容内容','来源','1,2,3','1'),('25','文章内容内容内容内容','来源','1,2,3','1'),('26','文章内容内容内容内容','来源','1,2,3','1'),('27','文章内容内容内容内容','来源','1,2,3','1'),('28','文章内容内容内容内容','来源','1,2,3','1'),('29','文章内容内容内容内容','来源','1,2,3','1'),('3','文章内容内容内容内容','来源','1,2,3','1'),('30','文章内容内容内容内容','来源','1,2,3','1'),('31','文章内容内容内容内容','来源','1,2,3','1'),('32','文章内容内容内容内容','来源','1,2,3','1'),('33','文章内容内容内容内容','来源','1,2,3','1'),('34','文章内容内容内容内容','来源','1,2,3','1'),('35','文章内容内容内容内容','来源','1,2,3','1'),('36','文章内容内容内容内容','来源','1,2,3','1'),('37','文章内容内容内容内容','来源','1,2,3','1'),('38','文章内容内容内容内容','来源','1,2,3','1'),('39','文章内容内容内容内容','来源','1,2,3','1'),('4','文章内容内容内容内容','来源','1,2,3','1'),('40','文章内容内容内容内容','来源','1,2,3','1'),('41','文章内容内容内容内容','来源','1,2,3','1'),('42','文章内容内容内容内容','来源','1,2,3','1'),('43','文章内容内容内容内容','来源','1,2,3','1'),('44','文章内容内容内容内容','来源','1,2,3','1'),('45','文章内容内容内容内容','来源','1,2,3','1'),('46','文章内容内容内容内容','来源','1,2,3','1'),('47','文章内容内容内容内容','来源','1,2,3','1'),('48','文章内容内容内容内容','来源','1,2,3','1'),('49','文章内容内容内容内容','来源','1,2,3','1'),('5','文章内容内容内容内容','来源','1,2,3','1'),('50','文章内容内容内容内容','来源','1,2,3','1'),('51','文章内容内容内容内容','来源','1,2,3','1'),('52','文章内容内容内容内容','来源','1,2,3','1'),('53','文章内容内容内容内容','来源','1,2,3','1'),('6','文章内容内容内容内容','来源','1,2,3','1'),('7','文章内容内容内容内容','来源','1,2,3','1'),('8','文章内容内容内容内容','来源','1,2,3','1'),('9','文章内容内容内容内容','来源','1,2,3','1');
/*!40000 ALTER TABLE `cms_article_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_category`
--

DROP TABLE IF EXISTS `cms_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_category` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `site_id` varchar(64) DEFAULT '1' COMMENT '站点编号',
  `office_id` varchar(64) DEFAULT NULL COMMENT '归属机构',
  `module` varchar(20) DEFAULT NULL COMMENT '栏目模块',
  `name` varchar(100) NOT NULL COMMENT '栏目名称',
  `image` varchar(255) DEFAULT NULL COMMENT '栏目图片',
  `href` varchar(255) DEFAULT NULL COMMENT '链接',
  `target` varchar(20) DEFAULT NULL COMMENT '目标',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `sort` int(11) DEFAULT '30' COMMENT '排序（升序）',
  `in_menu` char(1) DEFAULT '1' COMMENT '是否在导航中显示',
  `in_list` char(1) DEFAULT '1' COMMENT '是否在分类页中显示列表',
  `show_modes` char(1) DEFAULT '0' COMMENT '展现方式',
  `allow_comment` char(1) DEFAULT NULL COMMENT '是否允许评论',
  `is_audit` char(1) DEFAULT NULL COMMENT '是否需要审核',
  `custom_list_view` varchar(255) DEFAULT NULL COMMENT '自定义列表视图',
  `custom_content_view` varchar(255) DEFAULT NULL COMMENT '自定义内容视图',
  `view_config` text COMMENT '视图配置',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_category_parent_id` (`parent_id`),
  KEY `cms_category_module` (`module`),
  KEY `cms_category_name` (`name`),
  KEY `cms_category_sort` (`sort`),
  KEY `cms_category_del_flag` (`del_flag`),
  KEY `cms_category_office_id` (`office_id`),
  KEY `cms_category_site_id` (`site_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='栏目表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_category`
--

LOCK TABLES `cms_category` WRITE;
/*!40000 ALTER TABLE `cms_category` DISABLE KEYS */;
INSERT INTO `cms_category` VALUES ('1','0','0,','0','1',NULL,'顶级栏目',NULL,NULL,NULL,NULL,NULL,0,'1','1','0','0','1',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('10','1','0,1,','1','4','article','数据库','','','','','',20,'1','1','0','1','0','','','','1','2013-05-27 08:00:00','1','2016-08-04 19:54:25',NULL,'0'),('11','10','0,1,10,','1','4','article','网络工具',NULL,NULL,NULL,NULL,NULL,30,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('12','10','0,1,10,','1','4','article','浏览工具',NULL,NULL,NULL,NULL,NULL,40,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('13','10','0,1,10,','1','4','article','浏览辅助',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('14','10','0,1,10,','1','4','article','网络优化',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('15','10','0,1,10,','1','4','article','邮件处理',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('16','10','0,1,10,','1','4','article','下载工具',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('17','10','0,1,10,','1','4','article','搜索工具',NULL,NULL,NULL,NULL,NULL,50,'1','1','2','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('18','1','0,1,','1','5','link','友情链接',NULL,NULL,NULL,NULL,NULL,90,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('19','18','0,1,18,','1','5','link','常用网站',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('2','1','0,1,','1','3','article','JAVA','','','','','',10,'1','1','0','0','1','','','','1','2013-05-27 08:00:00','1','2016-08-04 19:54:16',NULL,'0'),('20','18','0,1,18,','1','5','link','门户网站',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('21','18','0,1,18,','1','5','link','购物网站',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('22','18','0,1,18,','1','5','link','交友社区',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('23','18','0,1,18,','1','5','link','音乐视频',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('24','1','0,1,','1','6',NULL,'百度一下',NULL,'http://www.baidu.com','_blank',NULL,NULL,90,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('25','1','0,1,','1','6',NULL,'全文检索',NULL,'/search',NULL,NULL,NULL,90,'0','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('26','1','0,1,','2','6','article','测试栏目',NULL,NULL,NULL,NULL,NULL,90,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('27','1','0,1,','1','6',NULL,'公共留言',NULL,'/guestbook',NULL,NULL,NULL,90,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','2','0,1,2,','1','3','article','网站简介',NULL,NULL,NULL,NULL,NULL,30,'1','1','0','0','1',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4','2','0,1,2,','1','3','article','内部机构',NULL,NULL,NULL,NULL,NULL,40,'1','1','0','0','1',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('5','2','0,1,2,','1','3','article','地方机构',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','0','1',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6','1','0,1,','1','3','article','jquery','','','','','',20,'1','1','1','1','0','','','','1','2013-05-27 08:00:00','1','2016-08-04 19:54:41',NULL,'0'),('7','6','0,1,6,','1','3','article','产品质量',NULL,NULL,NULL,NULL,NULL,30,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('8','6','0,1,6,','1','3','article','技术质量',NULL,NULL,NULL,NULL,NULL,40,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('9','6','0,1,6,','1','3','article','工程质量',NULL,NULL,NULL,NULL,NULL,50,'1','1','0','1','0',NULL,NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');
/*!40000 ALTER TABLE `cms_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_comment`
--

DROP TABLE IF EXISTS `cms_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_comment` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `category_id` varchar(64) NOT NULL COMMENT '栏目编号',
  `content_id` varchar(64) NOT NULL COMMENT '栏目内容的编号',
  `title` varchar(255) DEFAULT NULL COMMENT '栏目内容的标题',
  `content` varchar(255) DEFAULT NULL COMMENT '评论内容',
  `name` varchar(100) DEFAULT NULL COMMENT '评论姓名',
  `ip` varchar(100) DEFAULT NULL COMMENT '评论IP',
  `create_date` datetime NOT NULL COMMENT '评论时间',
  `audit_user_id` varchar(64) DEFAULT NULL COMMENT '审核人',
  `audit_date` datetime DEFAULT NULL COMMENT '审核时间',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_comment_category_id` (`category_id`),
  KEY `cms_comment_content_id` (`content_id`),
  KEY `cms_comment_status` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论表';
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
  `id` varchar(64) NOT NULL COMMENT '编号',
  `type` char(1) NOT NULL COMMENT '留言分类',
  `content` varchar(255) NOT NULL COMMENT '留言内容',
  `name` varchar(100) NOT NULL COMMENT '姓名',
  `email` varchar(100) NOT NULL COMMENT '邮箱',
  `phone` varchar(100) NOT NULL COMMENT '电话',
  `workunit` varchar(100) NOT NULL COMMENT '单位',
  `ip` varchar(100) NOT NULL COMMENT 'IP',
  `create_date` datetime NOT NULL COMMENT '留言时间',
  `re_user_id` varchar(64) DEFAULT NULL COMMENT '回复人',
  `re_date` datetime DEFAULT NULL COMMENT '回复时间',
  `re_content` varchar(100) DEFAULT NULL COMMENT '回复内容',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_guestbook_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='留言板';
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
  `id` varchar(64) NOT NULL COMMENT '编号',
  `category_id` varchar(64) NOT NULL COMMENT '栏目编号',
  `title` varchar(255) NOT NULL COMMENT '链接名称',
  `color` varchar(50) DEFAULT NULL COMMENT '标题颜色',
  `image` varchar(255) DEFAULT NULL COMMENT '链接图片',
  `href` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `weight` int(11) DEFAULT '0' COMMENT '权重，越大越靠前',
  `weight_date` datetime DEFAULT NULL COMMENT '权重期限',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_link_category_id` (`category_id`),
  KEY `cms_link_title` (`title`),
  KEY `cms_link_del_flag` (`del_flag`),
  KEY `cms_link_weight` (`weight`),
  KEY `cms_link_create_by` (`create_by`),
  KEY `cms_link_update_date` (`update_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='友情链接';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_link`
--

LOCK TABLES `cms_link` WRITE;
/*!40000 ALTER TABLE `cms_link` DISABLE KEYS */;
INSERT INTO `cms_link` VALUES ('1','19','JeeSite',NULL,NULL,'http://thinkgem.github.com/jeesite',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('10','22','58同城',NULL,NULL,'http://www.58.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('11','23','视频大全',NULL,NULL,'http://v.360.cn/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('12','23','凤凰网',NULL,NULL,'http://www.ifeng.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','19','ThinkGem',NULL,NULL,'http://thinkgem.iteye.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','19','百度一下',NULL,NULL,'http://www.baidu.com',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4','19','谷歌搜索',NULL,NULL,'http://www.google.com',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('5','20','新浪网',NULL,NULL,'http://www.sina.com.cn',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6','20','腾讯网',NULL,NULL,'http://www.qq.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('7','21','淘宝网',NULL,NULL,'http://www.taobao.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('8','21','新华网',NULL,NULL,'http://www.xinhuanet.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('9','22','赶集网',NULL,NULL,'http://www.ganji.com/',0,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');
/*!40000 ALTER TABLE `cms_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cms_site`
--

DROP TABLE IF EXISTS `cms_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cms_site` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `name` varchar(100) NOT NULL COMMENT '站点名称',
  `title` varchar(100) NOT NULL COMMENT '站点标题',
  `logo` varchar(255) DEFAULT NULL COMMENT '站点Logo',
  `domain` varchar(255) DEFAULT NULL COMMENT '站点域名',
  `description` varchar(255) DEFAULT NULL COMMENT '描述',
  `keywords` varchar(255) DEFAULT NULL COMMENT '关键字',
  `theme` varchar(255) DEFAULT 'default' COMMENT '主题',
  `copyright` text COMMENT '版权信息',
  `custom_index_view` varchar(255) DEFAULT NULL COMMENT '自定义站点首页视图',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `cms_site_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='站点表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cms_site`
--

LOCK TABLES `cms_site` WRITE;
/*!40000 ALTER TABLE `cms_site` DISABLE KEYS */;
INSERT INTO `cms_site` VALUES ('1','默认站点','JeeSite Web',NULL,NULL,'JeeSite','JeeSite','basic','Copyright &copy; 2012-2013 <a href=\'http://thinkgem.iteye.com\' target=\'_blank\'>ThinkGem</a> - Powered By <a href=\'https://github.com/thinkgem/jeesite\' target=\'_blank\'>JeeSite</a> V1.0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','子站点测试','JeeSite Subsite',NULL,NULL,'JeeSite subsite','JeeSite subsite','basic','Copyright &copy; 2012-2013 <a href=\'http://thinkgem.iteye.com\' target=\'_blank\'>ThinkGem</a> - Powered By <a href=\'https://github.com/thinkgem/jeesite\' target=\'_blank\'>JeeSite</a> V1.0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0');
/*!40000 ALTER TABLE `cms_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_scheme`
--

DROP TABLE IF EXISTS `gen_scheme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_scheme` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `category` varchar(2000) DEFAULT NULL COMMENT '分类',
  `package_name` varchar(500) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `sub_module_name` varchar(30) DEFAULT NULL COMMENT '生成子模块名',
  `function_name` varchar(500) DEFAULT NULL COMMENT '生成功能名',
  `function_name_simple` varchar(100) DEFAULT NULL COMMENT '生成功能名（简写）',
  `function_author` varchar(100) DEFAULT NULL COMMENT '生成功能作者',
  `gen_table_id` varchar(200) DEFAULT NULL COMMENT '生成表编号',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_scheme_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='生成方案';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_scheme`
--

LOCK TABLES `gen_scheme` WRITE;
/*!40000 ALTER TABLE `gen_scheme` DISABLE KEYS */;
INSERT INTO `gen_scheme` VALUES ('034ce50d45bb4320be45d38511c043d9','个人基础信息','curd','com.thinkgem.jeesite.modules','resume','','个人基础信息','个人基础信息','zhaojf','229400ebd07249a6815a37ee0dce4710','1','2016-07-21 17:21:00','1','2016-07-21 17:21:00','','0'),('35a13dc260284a728a270db3f382664b','树结构','treeTable','com.thinkgem.jeesite.modules','test',NULL,'树结构生成','树结构','ThinkGem','f6e4dafaa72f4c509636484715f33a96','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('74a4d81ea77d4abab72374df0ed90fe6','个人基础信息','curd','com.thinkgem.jeesite.modules','resume','','个人基础信息','resume','zhaojf','341adfbbd1894a089be1196396428e20','1','2016-07-21 15:48:05','1','2016-07-21 15:48:05','','1'),('86d3f4e9c99c4b90a3d1feee1154ed2a','微信用户','curd','com.thinkgem.jeesite.modules','wechat','','微信用户','微信用户','zhaojf','6a1f05b34c3a46a6b0ef42f09c4271c8','1','2016-07-18 19:42:47','1','2016-07-18 19:42:47','','0'),('9c9de9db6da743bb899036c6546061ac','单表','curd','com.thinkgem.jeesite.modules','test',NULL,'单表生成','单表','ThinkGem','aef6f1fc948f4c9ab1c1b780bc471cc2','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('a5834c2a24734b07b815e3e0a660b22c','绑定用户','curd','com.thinkgem.jeesite.modules','account','','绑定用户','绑定用户','zhaojf','1e4e3d1a4a61423a86949011843ec4ed','1','2016-07-19 11:05:41','1','2016-07-19 11:05:48','','1'),('b6448a40d51344beb53f084d069abae9','签到管理','curd','com.thinkgem.jeesite.modules','qiandao','','签到管理','签到成功','773152','dbd4126e43eb4978b1e3099e920b4416','1','2016-08-01 17:51:33','1','2016-08-01 17:56:52','','0'),('baed2816cbf54f1799287b4ee2cbb125','个人基础信息','curd','com.thinkgem.jeesite.modules','resume','','个人基础信息','个人基础信息','zhaojf','c3d9205399914896b72fea6cd962cd99','1','2016-07-21 16:26:35','1','2016-07-21 16:26:35','','1'),('d1373b3d3b4f447cb72dd902e17b0196','个人基础信息','curd','com.thinkgem.jeesite.modules','resume','','个人基础信息','个人基础信息','zhaojf','3d721d0d5c424b5fac3c1ab702cfaf77','1','2016-07-21 16:33:42','1','2016-07-21 16:40:58','','1'),('e6d905fd236b46d1af581dd32bdfb3b0','主子表','curd_many','com.thinkgem.jeesite.modules','test',NULL,'主子表生成','主子表','ThinkGem','43d6d5acffa14c258340ce6765e46c6f','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('f3e61c6fb03c429f81ddede407a35578','微信地理位置','curd','com.thinkgem.jeesite.modules','location','','微信地理位置','微信地理位置','zhaojf','1c68860c5701474788d4627b05281a24','1','2016-07-18 20:41:28','1','2016-07-18 20:41:28','','0'),('fc5b178223ef45c1b41079659c4f823d','绑定用户','curd','com.thinkgem.jeesite.modules','account','','绑定用户','绑定用户','zhaojf','667b900e55b04031bd25301c0589bdf2','1','2016-07-19 11:17:10','1','2016-07-19 11:17:10','','1');
/*!40000 ALTER TABLE `gen_scheme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table`
--

DROP TABLE IF EXISTS `gen_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_table` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `comments` varchar(500) DEFAULT NULL COMMENT '描述',
  `class_name` varchar(100) DEFAULT NULL COMMENT '实体类名称',
  `parent_table` varchar(200) DEFAULT NULL COMMENT '关联父表',
  `parent_table_fk` varchar(100) DEFAULT NULL COMMENT '关联父表外键',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_table_name` (`name`),
  KEY `gen_table_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table`
--

LOCK TABLES `gen_table` WRITE;
/*!40000 ALTER TABLE `gen_table` DISABLE KEYS */;
INSERT INTO `gen_table` VALUES ('1c68860c5701474788d4627b05281a24','wechat_location','wechat_location','WechatLocation','','','1','2016-07-18 20:40:48','1','2016-07-18 20:40:48','','0'),('1e4e3d1a4a61423a86949011843ec4ed','uc_account','uc_account','UcAccount','','','1','2016-07-19 11:04:55','1','2016-07-19 11:04:55','','1'),('229400ebd07249a6815a37ee0dce4710','resume','resume','Resume','','','1','2016-07-21 17:20:40','1','2016-07-21 17:20:40','','1'),('341adfbbd1894a089be1196396428e20','resume','resume','Resume','','','1','2016-07-21 15:47:09','1','2016-07-21 15:47:09','','1'),('3d721d0d5c424b5fac3c1ab702cfaf77','resume','个人基础信息','Resume','','','1','2016-07-21 16:32:44','1','2016-07-21 16:32:44','','1'),('4146c299178d44dfb125f9637179fd9c','uc_members','uc_members','UcMembers','','','1','2016-07-19 11:00:49','1','2016-07-19 11:00:49','','1'),('43d6d5acffa14c258340ce6765e46c6f','test_data_main','业务数据表','TestDataMain',NULL,NULL,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('667b900e55b04031bd25301c0589bdf2','uc_account','uc_account','UcAccount','','','1','2016-07-19 11:16:43','1','2016-07-19 11:16:43','','1'),('6a1f05b34c3a46a6b0ef42f09c4271c8','wechat_member','wechat_member','WechatMember','','','1','2016-07-18 19:41:42','1','2016-07-18 19:41:42','','0'),('6e05c389f3c6415ea34e55e9dfb28934','test_data_child','业务数据子表','TestDataChild','test_data_main','test_data_main_id','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('aef6f1fc948f4c9ab1c1b780bc471cc2','test_data','业务数据表','TestData',NULL,NULL,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('c3d9205399914896b72fea6cd962cd99','resume','resume','Resume','','','1','2016-07-21 16:25:47','1','2016-07-21 16:25:47','','1'),('dbd4126e43eb4978b1e3099e920b4416','hr_qiandao','hr_qiandao','Qiandao','','','1','2016-08-01 17:50:51','1','2016-08-01 17:56:14','','0'),('f6e4dafaa72f4c509636484715f33a96','test_tree','树结构表','TestTree',NULL,NULL,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0');
/*!40000 ALTER TABLE `gen_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_table_column`
--

DROP TABLE IF EXISTS `gen_table_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_table_column` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `gen_table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `comments` varchar(500) DEFAULT NULL COMMENT '描述',
  `jdbc_type` varchar(100) DEFAULT NULL COMMENT '列的数据类型的字节长度',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键',
  `is_null` char(1) DEFAULT NULL COMMENT '是否可为空',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段',
  `query_type` varchar(200) DEFAULT NULL COMMENT '查询方式（等于、不等于、大于、小于、范围、左LIKE、右LIKE、左右LIKE）',
  `show_type` varchar(200) DEFAULT NULL COMMENT '字段生成方案（文本框、文本域、下拉框、复选框、单选框、字典选择、人员选择、部门选择、区域选择）',
  `dict_type` varchar(200) DEFAULT NULL COMMENT '字典类型',
  `settings` varchar(2000) DEFAULT NULL COMMENT '其它设置（扩展字段JSON）',
  `sort` decimal(10,0) DEFAULT NULL COMMENT '排序（升序）',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_table_column_table_id` (`gen_table_id`),
  KEY `gen_table_column_name` (`name`),
  KEY `gen_table_column_sort` (`sort`),
  KEY `gen_table_column_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务表字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gen_table_column`
--

LOCK TABLES `gen_table_column` WRITE;
/*!40000 ALTER TABLE `gen_table_column` DISABLE KEYS */;
INSERT INTO `gen_table_column` VALUES ('00ace65cd68743a6a480d4643cea0dde','c3d9205399914896b72fea6cd962cd99','email','email','varchar(80)','String','email','0','1','1','1','0','0','=','input','',NULL,130,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('02313878526c4c3bb5e5cd8976f14fc2','229400ebd07249a6815a37ee0dce4710','name','姓名','varchar(20)','String','name','0','0','1','1','1','1','like','input','',NULL,20,'1','2016-07-21 17:20:40','1','2016-07-21 17:20:40',NULL,'1'),('02c6f29873094e17b5d910acd443aa79','c3d9205399914896b72fea6cd962cd99','ali_talk','旺旺id','varchar(100)','String','aliTalk','0','1','1','1','0','0','=','input','',NULL,320,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('02d95480a7234ff38117471ed9c0b8f4','3d721d0d5c424b5fac3c1ab702cfaf77','stature','身高','int(11)','String','stature','0','1','1','1','0','0','=','input','',NULL,280,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('0622352dff0f40b1945060ed86bd8f30','1e4e3d1a4a61423a86949011843ec4ed','status','状态','char(1)','String','status','0','0','1','1','0','0','=','input','',NULL,90,'1','2016-07-19 11:04:55','1','2016-07-19 11:04:55',NULL,'1'),('08ed55c098594a539b448be7de08508f','1c68860c5701474788d4627b05281a24','remarks','备注信息','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,120,'1','2016-07-18 20:40:48','1','2016-07-18 20:40:48',NULL,'0'),('0902a0cb3e8f434280c20e9d771d0658','aef6f1fc948f4c9ab1c1b780bc471cc2','sex','性别','char(1)','String','sex','0','1','1','1','1','1','=','radiobox','sex',NULL,6,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('0b35175086ab42df99777df229e3f84c','229400ebd07249a6815a37ee0dce4710','birthday','出生日期','varchar(12)','String','birthday','0','1','1','1','0','0','=','dateselect','',NULL,50,'1','2016-07-21 17:20:40','1','2016-07-21 17:20:40',NULL,'1'),('0d12f0d083d34ff2a5a9115a4682f512','c3d9205399914896b72fea6cd962cd99','status','状态','char(1)','String','status','0','0','1','1','0','0','=','select','del_flag',NULL,360,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('0e7c7dbc118a4f85a0ae617732bb2e3b','6a1f05b34c3a46a6b0ef42f09c4271c8','status','已关注','char(1)','String','status','0','0','1','1','0','0','=','input','',NULL,200,'1','2016-07-18 19:41:42','1','2016-07-18 19:41:42',NULL,'0'),('0f1f7f888e924cea9cea752d3f57c403','341adfbbd1894a089be1196396428e20','marrige','婚姻状况','int(11)','String','marrige','0','1','1','1','0','0','=','input','',NULL,290,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('101474de94794b78abdd38917f4e88b6','3d721d0d5c424b5fac3c1ab702cfaf77','current_situation','求职状态','int(11)','String','currentSituation','0','1','1','1','0','0','=','input','',NULL,160,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('103fc05c88ff40639875c2111881996a','aef6f1fc948f4c9ab1c1b780bc471cc2','create_date','创建时间','timestamp(6)','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect',NULL,NULL,9,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('114b76185664498eb1966873eaa5a7c1','229400ebd07249a6815a37ee0dce4710','salary','目前年薪','int(11)','String','salary','0','1','1','1','0','0','=','input','',NULL,110,'1','2016-07-21 17:20:40','1','2016-07-21 17:20:40',NULL,'1'),('12fa38dd986e41908f7fefa5839d1220','6e05c389f3c6415ea34e55e9dfb28934','create_by','创建者','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input',NULL,NULL,4,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('13c13d252d324578950a61254e6cca2f','c3d9205399914896b72fea6cd962cd99','headimg','个人头像','blob','String','headimg','0','1','1','1','0','0','=','fileselect','',NULL,40,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('13c8cd81627948be85ecf83b46abe958','1c68860c5701474788d4627b05281a24','openid','用户的标识，对当前公众号唯一','varchar(200)','String','openid','0','0','1','1','0','0','=','input','',NULL,20,'1','2016-07-18 20:40:48','1','2016-07-18 20:40:48',NULL,'0'),('14dd9f38dd484eeba07001fcb5428e4b','341adfbbd1894a089be1196396428e20','address','地址','varchar(150)','String','address','0','1','1','1','0','0','=','input','',NULL,340,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('155eee0421ee4664bfc51a61d756921a','3d721d0d5c424b5fac3c1ab702cfaf77','month_of_birthday','出生日期-月','char(2)','String','monthOfBirthday','0','1','1','1','0','0','=','input','',NULL,70,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('15e73323dde44b9b9e6fcbbde8b0b180','6a1f05b34c3a46a6b0ef42f09c4271c8','headimgurl','用户头像，最后一个数值代表正方形头像大小（有0、46、64、96、132数值可选，0代表640*640正方形头像），用户没有头像时该项为空。若用户更换头像，原有头像URL将失效。','varchar(200)','String','headimgurl','0','1','1','1','0','0','=','input','',NULL,100,'1','2016-07-18 19:41:42','1','2016-07-18 19:41:42',NULL,'0'),('1627961650bc42d484f2f7072a18c43d','1c68860c5701474788d4627b05281a24','update_date','更新时间','datetime','java.util.Date','updateDate','0','1','1','1','1','0','=','dateselect','',NULL,110,'1','2016-07-18 20:40:48','1','2016-07-18 20:40:48',NULL,'0'),('17bfba3b5a4b4d2ca1ab09306f1830f3','c3d9205399914896b72fea6cd962cd99','year_of_birthday','出生日期-年','char(4)','String','yearOfBirthday','0','1','1','1','0','0','=','input','',NULL,60,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('195ee9241f954d008fe01625f4adbfef','f6e4dafaa72f4c509636484715f33a96','create_by','创建者','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input',NULL,NULL,6,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('19c6478b8ff54c60910c2e4fc3d27503','43d6d5acffa14c258340ce6765e46c6f','id','编号','varchar2(64)','String','id','1','0','1','0','0','0','=','input',NULL,NULL,1,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('1ac6562f753d4e599693840651ab2bf7','43d6d5acffa14c258340ce6765e46c6f','in_date','加入日期','date(7)','java.util.Date','inDate','0','1','1','1','0','0','=','dateselect',NULL,NULL,7,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('1ad716aaa3084fd186956c097982ef86','4146c299178d44dfb125f9637179fd9c','email','email','char(32)','String','email','0','0','1','1','0','0','=','input','',NULL,60,'1','2016-07-19 11:00:49','1','2016-07-19 11:00:49',NULL,'1'),('1b20e6624a8a49209cd7022fcf300679','667b900e55b04031bd25301c0589bdf2','phone','手机号','varchar(200)','String','phone','0','1','1','1','0','0','=','input','',NULL,30,'1','2016-07-19 11:16:43','1','2016-07-19 11:16:43',NULL,'1'),('1b8eb55f65284fa6b0a5879b6d8ad3ec','aef6f1fc948f4c9ab1c1b780bc471cc2','in_date','加入日期','date(7)','java.util.Date','inDate','0','1','1','1','0','1','between','dateselect',NULL,NULL,7,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('1bde319c00094876893a86dde7f4f440','c3d9205399914896b72fea6cd962cd99','student_group','工作经验','int(11)','String','studentGroup','0','1','1','1','0','0','=','input','',NULL,350,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('1bdfa873914a4a77a139e4c0f58bb0b5','3d721d0d5c424b5fac3c1ab702cfaf77','fpextension','公司电话-分机','char(10)','String','fpextension','0','1','1','1','0','0','=','input','',NULL,210,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('1d5ca4d114be41e99f8dc42a682ba609','aef6f1fc948f4c9ab1c1b780bc471cc2','user_id','归属用户','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','user.id|name','0','1','1','1','1','1','=','userselect',NULL,NULL,2,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('1f26f289701c4ca184d285d1a13a4a69','dbd4126e43eb4978b1e3099e920b4416','create_by','创建者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input','',NULL,60,'1','2016-08-01 17:50:52','1','2016-08-01 17:56:14',NULL,'0'),('20a36cf1c6b644e187d0e3ebdd5b6272','4146c299178d44dfb125f9637179fd9c','regdate','regdate','int(10) unsigned','String','regdate','0','0','1','1','0','0','=','input','',NULL,100,'1','2016-07-19 11:00:49','1','2016-07-19 11:00:49',NULL,'1'),('21756504ffdc487eb167a823f89c0c06','43d6d5acffa14c258340ce6765e46c6f','update_by','更新者','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input',NULL,NULL,10,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('22fa6d874a274290bb1c24ef3319ddc8','341adfbbd1894a089be1196396428e20','hpcity','家庭电话-区号','char(5)','String','hpcity','0','1','1','1','0','0','=','input','',NULL,230,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('240e09e2b1104414a20feefd7cfd9b1d','229400ebd07249a6815a37ee0dce4710','mobile','手机号码','varchar(20)','String','mobile','0','1','1','1','0','0','=','input','',NULL,130,'1','2016-07-21 17:20:40','1','2016-07-21 17:20:40',NULL,'1'),('24196287e85b4735a6cf967b6a14d8c5','c3d9205399914896b72fea6cd962cd99','month_of_birthday','出生日期-月','char(2)','String','monthOfBirthday','0','1','1','1','0','0','=','input','',NULL,70,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('243b3c8cf7f0459c899bd4ad3f7077a9','229400ebd07249a6815a37ee0dce4710','current_situation','求职状态','int(11)','String','currentSituation','0','1','1','1','0','0','=','input','',NULL,120,'1','2016-07-21 17:20:40','1','2016-07-21 17:20:40',NULL,'1'),('244237ac6cd24238a9acd2892c559bf0','229400ebd07249a6815a37ee0dce4710','ali_talk','旺旺id','varchar(100)','String','aliTalk','0','1','1','1','0','0','=','input','',NULL,200,'1','2016-07-21 17:20:40','1','2016-07-21 17:20:40',NULL,'1'),('24bbdc0a555e4412a106ab1c5f03008e','f6e4dafaa72f4c509636484715f33a96','parent_ids','所有父级编号','varchar2(2000)','String','parentIds','0','0','1','1','0','0','like','input',NULL,NULL,3,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('25086a9d312145cdaae5052aa80ff5e3','667b900e55b04031bd25301c0589bdf2','create_date','创建时间','datetime','java.util.Date','createDate','0','1','1','0','0','0','=','dateselect','',NULL,60,'1','2016-07-19 11:16:43','1','2016-07-19 11:16:43',NULL,'1'),('26d7674ac1eb4157823d41c4354b437c','4146c299178d44dfb125f9637179fd9c','username','username','char(15)','String','username','0','0','1','1','0','0','=','input','',NULL,20,'1','2016-07-19 11:00:49','1','2016-07-19 11:00:49',NULL,'1'),('2af9c9ac0ba14711b1d0c93740c0cbdb','341adfbbd1894a089be1196396428e20','headimgurl','个人头像','varchar(200)','String','headimgurl','0','1','1','1','0','0','=','input','',NULL,40,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('2afce59c3a8e4eeab47d2243a4f07a30','6a1f05b34c3a46a6b0ef42f09c4271c8','remarks','备注信息','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,190,'1','2016-07-18 19:41:42','1','2016-07-18 19:41:42',NULL,'0'),('2b4aade3c76c4fd6ad7e4e7c73fb3bef','229400ebd07249a6815a37ee0dce4710','zip_code','邮编','char(6)','String','zipCode','0','1','1','1','0','0','=','input','',NULL,190,'1','2016-07-21 17:20:40','1','2016-07-21 17:20:40',NULL,'1'),('2f148fac928b440c92b6961d2578eb30','1e4e3d1a4a61423a86949011843ec4ed','truename','真实姓名','varchar(200)','String','truename','0','1','1','1','0','0','=','input','',NULL,30,'1','2016-07-19 11:04:55','1','2016-07-19 11:04:55',NULL,'1'),('3072a16596384a3b98825769b256edc4','3d721d0d5c424b5fac3c1ab702cfaf77','home_page','个人主页','varchar(200)','String','homePage','0','1','1','1','0','0','=','input','',NULL,330,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('312abc44c0ba42889b98e14869c5c9cb','667b900e55b04031bd25301c0589bdf2','update_date','更新时间','datetime','java.util.Date','updateDate','0','1','1','1','1','0','=','dateselect','',NULL,80,'1','2016-07-19 11:16:43','1','2016-07-19 11:16:43',NULL,'1'),('33152ce420904594b3eac796a27f0560','6e05c389f3c6415ea34e55e9dfb28934','id','编号','varchar2(64)','String','id','1','0','1','0','0','0','=','input',NULL,NULL,1,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('33c217d2f32b4f3a8491a994267d0139','c3d9205399914896b72fea6cd962cd99','work_year','工作年限','int(11)','String','workYear','0','1','1','1','0','0','=','input','',NULL,90,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('35af241859624a01917ab64c3f4f0813','aef6f1fc948f4c9ab1c1b780bc471cc2','del_flag','删除标记（0：正常；1：删除）','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,13,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('36a5bfa8e549499a81cbb759746a2d33','4146c299178d44dfb125f9637179fd9c','uid','uid','mediumint(8) unsigned','String','uid','1','0','1','1','0','0','=','input','',NULL,10,'1','2016-07-19 11:00:49','1','2016-07-19 11:00:49',NULL,'1'),('36da3857cf504ebdad23e0e8a33186e9','341adfbbd1894a089be1196396428e20','hpnumber','家庭电话-电话号码','char(20)','String','hpnumber','0','1','1','1','0','0','=','input','',NULL,240,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('375f56d9556e481ead176a1dd8911155','1c68860c5701474788d4627b05281a24','precision','地理位置精度','varchar(200)','String','precision','0','1','1','1','0','0','=','input','',NULL,30,'1','2016-07-18 20:40:48','1','2016-07-18 20:40:48',NULL,'0'),('38e274f3d7434717bf472642a159076f','3d721d0d5c424b5fac3c1ab702cfaf77','salary','目前年薪','int(11)','String','salary','0','1','1','1','0','0','=','input','',NULL,140,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('398b4a03f06940bfb979ca574e1911e3','aef6f1fc948f4c9ab1c1b780bc471cc2','create_by','创建者','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input',NULL,NULL,8,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('3a70b55133e64596982473c8f3706e6b','c3d9205399914896b72fea6cd962cd99','qq_talk','qq号','varchar(20)','String','qqTalk','0','1','1','1','0','0','=','input','',NULL,300,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('3a7cf23ae48a4c849ceb03feffc7a524','43d6d5acffa14c258340ce6765e46c6f','area_id','归属区域','nvarchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.Area','area.id|name','0','1','1','1','0','0','=','areaselect',NULL,NULL,4,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('3c5a9f8d26dc4908b448f3e8a0b41638','c3d9205399914896b72fea6cd962cd99','current_situation','求职状态','int(11)','String','currentSituation','0','1','1','1','0','0','=','input','',NULL,160,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('3d9c32865bb44e85af73381df0ffbf3d','43d6d5acffa14c258340ce6765e46c6f','update_date','更新时间','timestamp(6)','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect',NULL,NULL,11,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('3db756271ca94753865075bc282f45bc','341adfbbd1894a089be1196396428e20','fpnumber','公司电话-总机号码','char(20)','String','fpnumber','0','1','1','1','0','0','=','input','',NULL,200,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('3e8da15e6a0b4639950126d73fa44512','3d721d0d5c424b5fac3c1ab702cfaf77','fpcity','公司电话-区号','char(5)','String','fpcity','0','1','1','1','0','0','=','input','',NULL,190,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('40f6c4df096b43b5a1f68c84edc65328','3d721d0d5c424b5fac3c1ab702cfaf77','status','状态','char(1)','String','status','0','0','1','1','0','0','=','select','del_flag',NULL,360,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('410937716b5541a9aaf9778c1cfcf0d0','c3d9205399914896b72fea6cd962cd99','name','姓名','varchar(20)','String','name','0','1','1','1','1','1','like','input','',NULL,20,'1','2016-07-21 16:25:47','1','2016-07-21 16:25:47',NULL,'1'),('416c76d2019b4f76a96d8dc3a8faf84c','f6e4dafaa72f4c509636484715f33a96','update_date','更新时间','timestamp(6)','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect',NULL,NULL,9,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('4175f707deae43479e229ca9c7042f24','3d721d0d5c424b5fac3c1ab702cfaf77','name','姓名','varchar(20)','String','name','0','1','1','1','1','1','like','input','',NULL,20,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('447469e5138e4c8d8ffbee9fe3a98615','dbd4126e43eb4978b1e3099e920b4416','del_flag','删除标记','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,110,'1','2016-08-01 17:50:52','1','2016-08-01 17:56:14',NULL,'0'),('46a271d30cef4e5fb3e52f6dfe620599','3d721d0d5c424b5fac3c1ab702cfaf77','hpnation','家庭电话','char(5)','String','hpnation','0','1','1','1','0','0','=','input','',NULL,220,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('46b2038347e843b387c5256450a426d0','c3d9205399914896b72fea6cd962cd99','salary','目前年薪','int(11)','String','salary','0','1','1','1','0','0','=','input','',NULL,140,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('46e6d8283270493687085d29efdecb05','f6e4dafaa72f4c509636484715f33a96','del_flag','删除标记（0：正常；1：删除）','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,11,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('47b85390b9f14fd4ad4a1f25f0950c10','667b900e55b04031bd25301c0589bdf2','account_no','虚拟账户','varchar(20)','String','accountNo','0','1','1','1','0','0','=','input','',NULL,20,'1','2016-07-19 11:16:43','1','2016-07-19 11:16:43',NULL,'1'),('47dc7104d72f4327bd13618a51db97e2','341adfbbd1894a089be1196396428e20','nationality','国家或地区','varchar(150)','String','nationality','0','1','1','1','0','0','=','input','',NULL,270,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('47ed31cd7b4045d7bb5f00670c778d3d','3d721d0d5c424b5fac3c1ab702cfaf77','currtype','币种','int(11)','String','currtype','0','1','1','1','0','0','=','input','',NULL,150,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('4a0a1fff86ca46519477d66b82e01991','aef6f1fc948f4c9ab1c1b780bc471cc2','name','名称','nvarchar2(100)','String','name','0','1','1','1','1','1','like','input',NULL,NULL,5,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('4a63b3a6f6834501b037ac06dc8b27b4','c3d9205399914896b72fea6cd962cd99','hukou','户口','varchar(150)','String','hukou','0','1','1','1','0','0','=','input','',NULL,250,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('4b04bf2fbbfb402cafc4e395ce241695','341adfbbd1894a089be1196396428e20','fpnation','公司电话','char(5)','String','fpnation','0','1','1','1','0','0','=','input','',NULL,180,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('4b172bc9f8e941cb84fd6a49add5e74c','c3d9205399914896b72fea6cd962cd99','fpextension','公司电话-分机','char(10)','String','fpextension','0','1','1','1','0','0','=','input','',NULL,210,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('4b62db4cbbcb4b71a30e4582e8e75b0f','3d721d0d5c424b5fac3c1ab702cfaf77','address','地址','varchar(150)','String','address','0','1','1','1','0','0','=','input','',NULL,340,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('4c60271f6098493bb89ed1665640a609','229400ebd07249a6815a37ee0dce4710','gender','性别','int(11)','String','gender','0','1','1','1','0','0','=','select','sex',NULL,30,'1','2016-07-21 17:20:40','1','2016-07-21 17:20:40',NULL,'1'),('4c8ef12cb6924b9ba44048ba9913150b','43d6d5acffa14c258340ce6765e46c6f','create_date','创建时间','timestamp(6)','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect',NULL,NULL,9,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('4e5681527c594310b675886fe0edd6d2','3d721d0d5c424b5fac3c1ab702cfaf77','headimgurl','个人头像','varchar(200)','String','headimgurl','0','1','1','1','0','0','=','fileselect','',NULL,40,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('4f4b569f66f34063b51fb2203a3a91de','6a1f05b34c3a46a6b0ef42f09c4271c8','update_by','更新者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','1','1','1','0','0','=','input','',NULL,170,'1','2016-07-18 19:41:42','1','2016-07-18 19:41:42',NULL,'0'),('528a7961767146d1af75178034fd66ef','c3d9205399914896b72fea6cd962cd99','home_page','个人主页','varchar(200)','String','homePage','0','1','1','1','0','0','=','input','',NULL,330,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('52aa681a98b44468bc9eedad93132647','3d721d0d5c424b5fac3c1ab702cfaf77','location','居住地','varchar(150)','String','location','0','1','1','1','0','0','=','input','',NULL,120,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('52abb526ab874692a117db16542800fb','c3d9205399914896b72fea6cd962cd99','address','地址','varchar(150)','String','address','0','1','1','1','0','0','=','input','',NULL,340,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('53d65a3d306d4fac9e561db9d3c66912','6e05c389f3c6415ea34e55e9dfb28934','del_flag','删除标记（0：正常；1：删除）','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,9,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('5404f8c874b3481ca54baa878d6b7af2','229400ebd07249a6815a37ee0dce4710','headimgurl','个人头像','varchar(200)','String','headimgurl','0','1','1','1','0','0','=','fileselect','',NULL,40,'1','2016-07-21 17:20:40','1','2016-07-21 17:20:40',NULL,'1'),('550dcee0a5204207a5aa99b0ef8bbb8e','341adfbbd1894a089be1196396428e20','fpcity','公司电话-区号','char(5)','String','fpcity','0','1','1','1','0','0','=','input','',NULL,190,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('56fa71c0bd7e4132931874e548dc9ba5','6e05c389f3c6415ea34e55e9dfb28934','update_by','更新者','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input',NULL,NULL,6,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('58fb9809a496432eae7073f503e54068','3d721d0d5c424b5fac3c1ab702cfaf77','gender','性别','int(11)','String','gender','0','1','1','1','0','0','=','select','sex',NULL,30,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('591dbb4cff6c4ad7b90ee1ac350554b0','341adfbbd1894a089be1196396428e20','mobile','手机号码','varchar(20)','String','mobile','0','1','1','1','0','0','=','input','',NULL,170,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('5a4a1933c9c844fdba99de043dc8205e','aef6f1fc948f4c9ab1c1b780bc471cc2','update_by','更新者','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input',NULL,NULL,10,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('5a71db76850c4a7484a84c46cb6fd867','3d721d0d5c424b5fac3c1ab702cfaf77','ali_talk','旺旺id','varchar(100)','String','aliTalk','0','1','1','1','0','0','=','input','',NULL,320,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('5b22e5563b4143ed941cba72f9725207','c3d9205399914896b72fea6cd962cd99','nationality','国家或地区','varchar(150)','String','nationality','0','1','1','1','0','0','=','input','',NULL,270,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('5e5c69bd3eaa4dcc9743f361f3771c08','aef6f1fc948f4c9ab1c1b780bc471cc2','id','编号','varchar2(64)','String','id','1','0','1','0','0','0','=','input',NULL,NULL,1,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('5e87fe9d334442c6ad58db2541570edc','341adfbbd1894a089be1196396428e20','student_group','工作经验','int(11)','String','studentGroup','0','1','1','1','0','0','=','input','',NULL,350,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('60fd7bdc5e8d45ad869e295db210f213','dbd4126e43eb4978b1e3099e920b4416','date','日期','varchar(64)','String','date','0','0','1','1','0','0','=','input','',NULL,20,'1','2016-08-01 17:50:52','1','2016-08-01 17:56:14',NULL,'0'),('6179947b21e14a0b92e5e9cc6f14393e','c3d9205399914896b72fea6cd962cd99','mobile','手机号码','varchar(20)','String','mobile','0','1','1','1','0','0','=','input','',NULL,170,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('61f3637d9fff4a0099fe12fda1090169','6a1f05b34c3a46a6b0ef42f09c4271c8','language','用户的语言，简体中文为zh_CN','varchar(200)','String','language','0','1','1','1','0','0','=','input','',NULL,90,'1','2016-07-18 19:41:42','1','2016-07-18 19:41:42',NULL,'0'),('633f5a49ec974c099158e7b3e6bfa930','f6e4dafaa72f4c509636484715f33a96','name','名称','nvarchar2(100)','String','name','0','0','1','1','1','1','like','input',NULL,NULL,4,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('63efe2d6c7af4f57b9cf92a4ab97527d','341adfbbd1894a089be1196396428e20','year_of_birthday','出生日期-年','char(4)','String','yearOfBirthday','0','1','1','1','0','0','=','input','',NULL,60,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('64b995d9df1e436f96db25868c88d79f','341adfbbd1894a089be1196396428e20','gender','性别','int(11)','String','gender','0','1','1','1','0','0','=','select','sex',NULL,30,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('651c0a5c60c84d08a6d6e2a356ee435c','4146c299178d44dfb125f9637179fd9c','salt','salt','char(6)','String','salt','0','0','1','1','0','0','=','input','',NULL,130,'1','2016-07-19 11:00:49','1','2016-07-19 11:00:49',NULL,'1'),('652491500f2641ffa7caf95a93e64d34','6e05c389f3c6415ea34e55e9dfb28934','update_date','更新时间','timestamp(6)','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect',NULL,NULL,7,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('655ee38bea314c2d8926dfc5928d72ed','3d721d0d5c424b5fac3c1ab702cfaf77','hpnumber','家庭电话-电话号码','char(20)','String','hpnumber','0','1','1','1','0','0','=','input','',NULL,240,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('662bc28f52574cb0a5ade90385020c9f','dbd4126e43eb4978b1e3099e920b4416','create_date','创建时间','datetime','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect','',NULL,70,'1','2016-08-01 17:50:52','1','2016-08-01 17:56:14',NULL,'0'),('6763ff6dc7cd4c668e76cf9b697d3ff6','f6e4dafaa72f4c509636484715f33a96','sort','排序','number(10)','Integer','sort','0','0','1','1','1','0','=','input',NULL,NULL,5,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('67a9675c14894c52a74c88f287f0b2ff','229400ebd07249a6815a37ee0dce4710','work_year','工作年限','int(11)','String','workYear','0','1','1','1','0','0','=','input','',NULL,60,'1','2016-07-21 17:20:40','1','2016-07-21 17:20:40',NULL,'1'),('67d0331f809a48ee825602659f0778e8','43d6d5acffa14c258340ce6765e46c6f','name','名称','nvarchar2(100)','String','name','0','1','1','1','1','1','like','input',NULL,NULL,5,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('67eee55d5bc34062aef7af3626d5bcab','341adfbbd1894a089be1196396428e20','current_situation','求职状态','int(11)','String','currentSituation','0','1','1','1','0','0','=','input','',NULL,160,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('68345713bef3445c906f70e68f55de38','6e05c389f3c6415ea34e55e9dfb28934','test_data_main_id','业务主表','varchar2(64)','String','testDataMain.id','0','1','1','1','0','0','=','input',NULL,NULL,2,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('69ed98d1e1984fd292fb85af33779d14','3d721d0d5c424b5fac3c1ab702cfaf77','mobile','手机号码','varchar(20)','String','mobile','0','1','1','1','0','0','=','input','',NULL,170,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('6b15d763c78e44b8984df629b6abac3d','4146c299178d44dfb125f9637179fd9c','password','password','char(32)','String','password','0','0','1','1','0','0','=','input','',NULL,30,'1','2016-07-19 11:00:49','1','2016-07-19 11:00:49',NULL,'1'),('6bafd32de7404ccf84029ec15e36a5d3','6a1f05b34c3a46a6b0ef42f09c4271c8','subscribe_time','用户关注时间，为时间戳。如果用户曾多次关注，则取最后关注时间','varchar(200)','String','subscribeTime','0','1','1','1','0','0','=','input','',NULL,110,'1','2016-07-18 19:41:42','1','2016-07-18 19:41:42',NULL,'0'),('6bf45384046548cb9d108d4670c2ec97','3d721d0d5c424b5fac3c1ab702cfaf77','zip_code','邮编','char(6)','String','zipCode','0','1','1','1','0','0','=','input','',NULL,310,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('6f7cb5ea05a643e3b0288e98e941dcfe','dbd4126e43eb4978b1e3099e920b4416','id','用户的标识，对当前公众号唯一','varchar(200)','String','id','1','0','1','0','0','0','=','input','',NULL,10,'1','2016-08-01 17:50:52','1','2016-08-01 17:56:14',NULL,'0'),('6fa3a2a649b34142a70e12accbe8ecfe','dbd4126e43eb4978b1e3099e920b4416','update_date','更新时间','datetime','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect','',NULL,90,'1','2016-08-01 17:50:52','1','2016-08-01 17:56:14',NULL,'0'),('701ad20f50754155b220af09c625fe36','341adfbbd1894a089be1196396428e20','day_of_birthday','出生日期-日','char(2)','String','dayOfBirthday','0','1','1','1','0','0','=','input','',NULL,80,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('71ea4bc10d274911b405f3165fc1bb1a','aef6f1fc948f4c9ab1c1b780bc471cc2','area_id','归属区域','nvarchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.Area','area.id|name','0','1','1','1','1','1','=','areaselect',NULL,NULL,4,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('71fe19b8d78549629408ac55041fb5f7','341adfbbd1894a089be1196396428e20','month_of_birthday','出生日期-月','char(2)','String','monthOfBirthday','0','1','1','1','0','0','=','input','',NULL,70,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('74bae0010352466fafecc07c276289e8','6a1f05b34c3a46a6b0ef42f09c4271c8','create_by','创建者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','1','1','0','0','0','=','input','',NULL,150,'1','2016-07-18 19:41:42','1','2016-07-18 19:41:42',NULL,'0'),('77746b51c1e840d59f196f1a21c8aa37','dbd4126e43eb4978b1e3099e920b4416','update_by','更新者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input','',NULL,80,'1','2016-08-01 17:50:52','1','2016-08-01 17:56:14',NULL,'0'),('77b54ea3d3ad4e84860cbe068029f003','341adfbbd1894a089be1196396428e20','email','email','varchar(80)','String','email','0','1','1','1','0','0','=','input','',NULL,130,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('78efce808c20460883daf08d57001d64','6a1f05b34c3a46a6b0ef42f09c4271c8','nickname','用户的昵称','varchar(200)','String','nickname','0','1','1','1','0','0','=','input','',NULL,40,'1','2016-07-18 19:41:42','1','2016-07-18 19:41:42',NULL,'0'),('7a7d6166ad3149e59325da8c908f2539','3d721d0d5c424b5fac3c1ab702cfaf77','marrige','婚姻状况','int(11)','String','marrige','0','1','1','1','0','0','=','input','',NULL,290,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('7bdd63b5e8984753b39cbc31c28fe986','c3d9205399914896b72fea6cd962cd99','zip_code','邮编','char(6)','String','zipCode','0','1','1','1','0','0','=','input','',NULL,310,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('7cde129cf67e4740a8be58f31c8c73c7','4146c299178d44dfb125f9637179fd9c','myid','myid','char(30)','String','myid','0','0','1','1','0','0','=','input','',NULL,70,'1','2016-07-19 11:00:49','1','2016-07-19 11:00:49',NULL,'1'),('7e11d337d8af431bb12c3122c6e65b49','341adfbbd1894a089be1196396428e20','home_page','个人主页','varchar(200)','String','homePage','0','1','1','1','0','0','=','input','',NULL,330,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('7e62e8014d494365976140517c067b22','3d721d0d5c424b5fac3c1ab702cfaf77','day_of_birthday','出生日期-日','char(2)','String','dayOfBirthday','0','1','1','1','0','0','=','input','',NULL,80,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('7ea06ea8642e4f5abb60aee36b30d7d2','667b900e55b04031bd25301c0589bdf2','status','状态','char(1)','String','status','0','0','1','1','0','0','=','input','',NULL,100,'1','2016-07-19 11:16:43','1','2016-07-19 11:16:43',NULL,'1'),('7f72b93a1b984b21b592ba417946c057','c3d9205399914896b72fea6cd962cd99','currtype','币种','int(11)','String','currtype','0','1','1','1','0','0','=','input','',NULL,150,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('7f871058d94c4d9a89084be7c9ce806d','6e05c389f3c6415ea34e55e9dfb28934','remarks','备注信息','nvarchar2(255)','String','remarks','0','1','1','1','1','0','=','input',NULL,NULL,8,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('804ac4d5b7e84628b5086066ea8b70f5','1e4e3d1a4a61423a86949011843ec4ed','id','用户的标识，对当前公众号唯一','varchar(200)','String','id','1','0','1','0','0','0','=','input','',NULL,10,'1','2016-07-19 11:04:55','1','2016-07-19 11:04:55',NULL,'1'),('828e015e77fd4d4bae643a52e793f9d0','341adfbbd1894a089be1196396428e20','hukou','户口','varchar(150)','String','hukou','0','1','1','1','0','0','=','input','',NULL,250,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('8314ed81f4eb445999f52ba026b59380','6a1f05b34c3a46a6b0ef42f09c4271c8','unionid','只有在用户将公众号绑定到微信开放平台帐号后，才会出现该字段。','varchar(200)','String','unionid','0','1','1','1','0','0','=','input','',NULL,120,'1','2016-07-18 19:41:42','1','2016-07-18 19:41:42',NULL,'0'),('84fec0ccbf804e17b654e6ba124a8a1c','6a1f05b34c3a46a6b0ef42f09c4271c8','openid','用户的标识，对当前公众号唯一','varchar(200)','String','openid','0','0','1','1','0','0','=','input','',NULL,30,'1','2016-07-18 19:41:42','1','2016-07-18 19:41:42',NULL,'0'),('8a43414fcc904680a1dc2868da469d43','c3d9205399914896b72fea6cd962cd99','idnumber','证件号','varchar(25)','String','idnumber','0','1','1','1','0','0','=','input','',NULL,110,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('8b48774cfe184913b8b5eb17639cf12d','43d6d5acffa14c258340ce6765e46c6f','create_by','创建者','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','createBy.id','0','0','1','0','0','0','=','input',NULL,NULL,8,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('8b7cf0525519474ebe1de9e587eb7067','6e05c389f3c6415ea34e55e9dfb28934','create_date','创建时间','timestamp(6)','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect',NULL,NULL,5,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('8b9de88df53e485d8ef461c4b1824bc1','43d6d5acffa14c258340ce6765e46c6f','user_id','归属用户','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','user.id|name','0','1','1','1','1','1','=','userselect',NULL,NULL,2,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('8bc38271c3f3400298006bc6d404d9ed','3d721d0d5c424b5fac3c1ab702cfaf77','student_group','工作经验','int(11)','String','studentGroup','0','1','1','1','0','0','=','input','',NULL,350,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('8c00ed333d43489ca047602edd48cbb4','1e4e3d1a4a61423a86949011843ec4ed','remarks','备注信息','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,80,'1','2016-07-19 11:04:55','1','2016-07-19 11:04:55',NULL,'1'),('8c26006f177044b39e234e05462c8358','1c68860c5701474788d4627b05281a24','location_y','location_y','varchar(200)','String','locationY','0','1','1','1','0','0','=','input','',NULL,70,'1','2016-07-18 20:40:48','1','2016-07-18 20:40:48',NULL,'0'),('8da38dbe5fe54e9bb1f9682c27fbf403','aef6f1fc948f4c9ab1c1b780bc471cc2','remarks','备注信息','nvarchar2(255)','String','remarks','0','1','1','1','1','0','=','textarea',NULL,NULL,12,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('8dd9a6e0a9134a759a911684f5545edf','341adfbbd1894a089be1196396428e20','qq_talk','qq号','varchar(20)','String','qqTalk','0','1','1','1','0','0','=','input','',NULL,300,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('8e1c990f2bd44e2687783f45c84870ec','c3d9205399914896b72fea6cd962cd99','id','用户的标识，对当前公众号唯一','varchar(200)','String','id','1','0','1','0','0','0','=','input','',NULL,10,'1','2016-07-21 16:25:47','1','2016-07-21 16:25:47',NULL,'1'),('8e5093a3d98a47ba974b1cd540db687b','1c68860c5701474788d4627b05281a24','longitude','地理位置经度','varchar(200)','String','longitude','0','1','1','1','0','0','=','input','',NULL,50,'1','2016-07-18 20:40:48','1','2016-07-18 20:40:48',NULL,'0'),('8edb2dece4ce472785bce48c1f96033a','229400ebd07249a6815a37ee0dce4710','stature','身高','int(11)','String','stature','0','1','1','1','0','0','=','input','',NULL,160,'1','2016-07-21 17:20:40','1','2016-07-21 17:20:40',NULL,'1'),('9057428f63ff46ca8d68fd5e402f1ad6','229400ebd07249a6815a37ee0dce4710','location','居住地','varchar(150)','String','location','0','1','1','1','0','0','=','input','',NULL,90,'1','2016-07-21 17:20:40','1','2016-07-21 17:20:40',NULL,'1'),('92481c16a0b94b0e8bba16c3c54eb1e4','f6e4dafaa72f4c509636484715f33a96','create_date','创建时间','timestamp(6)','java.util.Date','createDate','0','0','1','0','0','0','=','dateselect',NULL,NULL,7,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('9272caf899e54a9fa1cc57e2e735d677','c3d9205399914896b72fea6cd962cd99','hpnumber','家庭电话-电话号码','char(20)','String','hpnumber','0','1','1','1','0','0','=','input','',NULL,240,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('92d157087bb54d8b8d1f08c3178bde3c','341adfbbd1894a089be1196396428e20','ali_talk','旺旺id','varchar(100)','String','aliTalk','0','1','1','1','0','0','=','input','',NULL,320,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('9568a35897a84c30ac675ed2dfa282d6','341adfbbd1894a089be1196396428e20','fpextension','公司电话-分机','char(10)','String','fpextension','0','1','1','1','0','0','=','input','',NULL,210,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('9610b063ba354b7796d99b2cb2d433c8','341adfbbd1894a089be1196396428e20','id','用户的标识，对当前公众号唯一','varchar(200)','String','id','1','0','1','0','0','0','=','input','',NULL,10,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('9672f7ad1b2b48469de771c24fb78f64','341adfbbd1894a089be1196396428e20','location','居住地','varchar(150)','String','location','0','1','1','1','0','0','=','input','',NULL,120,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('96850390fd4f4e188471c1898d606984','c3d9205399914896b72fea6cd962cd99','fpnation','公司电话','char(5)','String','fpnation','0','1','1','1','0','0','=','input','',NULL,180,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('9686f6adc75c4d7088390641d2137877','229400ebd07249a6815a37ee0dce4710','idnumber','证件号','varchar(25)','String','idnumber','0','0','1','1','0','0','=','input','',NULL,80,'1','2016-07-21 17:20:40','1','2016-07-21 17:20:40',NULL,'1'),('99b96468100a4f42aee1de356047fffe','229400ebd07249a6815a37ee0dce4710','home_page','个人主页','varchar(200)','String','homePage','0','1','1','1','0','0','=','input','',NULL,210,'1','2016-07-21 17:20:40','1','2016-07-21 17:20:40',NULL,'1'),('9a012c1d2f934dbf996679adb7cc827a','f6e4dafaa72f4c509636484715f33a96','parent_id','父级编号','varchar2(64)','This','parent.id|name','0','0','1','1','0','0','=','treeselect',NULL,NULL,2,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('9cf51e3d13004d9bb13950b378426b44','c3d9205399914896b72fea6cd962cd99','hpnation','家庭电话','char(5)','String','hpnation','0','1','1','1','0','0','=','input','',NULL,220,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('9dec681be6c94acebffe56c7c90bebb1','6a1f05b34c3a46a6b0ef42f09c4271c8','province','用户所在省份','varchar(200)','String','province','0','1','1','1','0','0','=','input','',NULL,80,'1','2016-07-18 19:41:42','1','2016-07-18 19:41:42',NULL,'0'),('9fd6a3ce545e4480a3790c20cf66f15c','3d721d0d5c424b5fac3c1ab702cfaf77','resumekey','关键字','char(12)','String','resumekey','0','1','1','1','0','0','=','input','',NULL,260,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('a0b907c7821a4154b1134b95f0bf7892','667b900e55b04031bd25301c0589bdf2','create_by','创建者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','1','1','0','0','0','=','input','',NULL,50,'1','2016-07-19 11:16:43','1','2016-07-19 11:16:43',NULL,'1'),('a2084550825149a5986edc7a1068170f','3d721d0d5c424b5fac3c1ab702cfaf77','email','email','varchar(80)','String','email','0','1','1','1','0','0','=','input','',NULL,130,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('a2dc5b0571144ced9b56b45ce874aa68','c3d9205399914896b72fea6cd962cd99','gender','性别','int(11)','String','gender','0','1','1','1','0','0','=','select','sex',NULL,30,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('a347f78cc57741cfbee5c718c7507914','3d721d0d5c424b5fac3c1ab702cfaf77','hpcity','家庭电话-区号','char(5)','String','hpcity','0','1','1','1','0','0','=','input','',NULL,230,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('a38a7f8db84547f890e817c6aa5fc0e9','3d721d0d5c424b5fac3c1ab702cfaf77','qq_talk','qq号','varchar(20)','String','qqTalk','0','1','1','1','0','0','=','input','',NULL,300,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('a3959a2753fe418790c0d551c09c3255','6a1f05b34c3a46a6b0ef42f09c4271c8','subscribe','用户是否订阅该公众号标识，值为0时，代表此用户没有关注该公众号，拉取不到其余信息。','varchar(200)','String','subscribe','0','1','1','1','0','0','=','input','',NULL,20,'1','2016-07-18 19:41:42','1','2016-07-18 19:41:42',NULL,'0'),('a5e11950c62d46919cbec9441603329a','6a1f05b34c3a46a6b0ef42f09c4271c8','country','用户所在国家','varchar(200)','String','country','0','1','1','1','0','0','=','input','',NULL,70,'1','2016-07-18 19:41:42','1','2016-07-18 19:41:42',NULL,'0'),('a920368b26e241f9a0caa986a44a35dd','6a1f05b34c3a46a6b0ef42f09c4271c8','remark','公众号运营者对粉丝的备注，公众号运营者可在微信公众平台用户管理界面对粉丝添加备注','varchar(200)','String','remark','0','1','1','1','0','0','=','input','',NULL,130,'1','2016-07-18 19:41:42','1','2016-07-18 19:41:42',NULL,'0'),('aa3bcf9ac2d64ddb8f5ee06545710a33','229400ebd07249a6815a37ee0dce4710','qq_talk','qq号','varchar(20)','String','qqTalk','0','1','1','1','0','0','=','input','',NULL,180,'1','2016-07-21 17:20:40','1','2016-07-21 17:20:40',NULL,'1'),('acca8c6581fc4ffbbb598e22d72670fa','c3d9205399914896b72fea6cd962cd99','card_type','证件类型','int(11)','String','cardType','0','1','1','1','0','0','=','input','',NULL,100,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('ad3bf0d4b44b4528a5211a66af88f322','aef6f1fc948f4c9ab1c1b780bc471cc2','office_id','归属部门','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.Office','office.id|name','0','1','1','1','1','1','=','officeselect',NULL,NULL,3,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('b0275300e9b7478798e50609b7c2e552','6a1f05b34c3a46a6b0ef42f09c4271c8','id','编号','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,10,'1','2016-07-18 19:41:42','1','2016-07-18 19:41:42',NULL,'0'),('b136e37daf7f4819ac360b1e3f296157','3d721d0d5c424b5fac3c1ab702cfaf77','nationality','国家或地区','varchar(150)','String','nationality','0','1','1','1','0','0','=','input','',NULL,270,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('b151afe196f24341b51daeca563e0318','4146c299178d44dfb125f9637179fd9c','myidkey','myidkey','char(16)','String','myidkey','0','0','1','1','0','0','=','input','',NULL,80,'1','2016-07-19 11:00:49','1','2016-07-19 11:00:49',NULL,'1'),('b3f2f4b9632c4372841efd65a2446e4d','dbd4126e43eb4978b1e3099e920b4416','clock_in','上班打卡','varchar(64)','String','clockIn','0','1','1','1','0','0','=','input','',NULL,40,'1','2016-08-01 17:50:52','1','2016-08-01 17:56:14',NULL,'0'),('b6135d22a4cd4ac38a080b2048e2d291','667b900e55b04031bd25301c0589bdf2','update_by','更新者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','1','1','1','0','0','=','input','',NULL,70,'1','2016-07-19 11:16:43','1','2016-07-19 11:16:43',NULL,'1'),('b6effdb87f234347bface2d29c7c6d28','4146c299178d44dfb125f9637179fd9c','secques','secques','char(8)','String','secques','0','0','1','1','0','0','=','input','',NULL,140,'1','2016-07-19 11:00:49','1','2016-07-19 11:00:49',NULL,'1'),('b7b8f9ebeab04995bbeb6096fbe8ac33','341adfbbd1894a089be1196396428e20','birthday','出生日期','varchar(12)','String','birthday','0','1','1','1','0','0','=','dateselect','',NULL,50,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('b8a531a439fc4487a4af5d961a139a66','6a1f05b34c3a46a6b0ef42f09c4271c8','update_date','更新时间','datetime','java.util.Date','updateDate','0','1','1','1','1','0','=','dateselect','',NULL,180,'1','2016-07-18 19:41:42','1','2016-07-18 19:41:42',NULL,'0'),('b8ee0e6c276a452b972c943fd19e3b8a','341adfbbd1894a089be1196396428e20','status','状态','char(1)','String','status','0','0','1','1','0','0','=','input','',NULL,360,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('b947f7a423ec4b8fac85e343d92c853a','c3d9205399914896b72fea6cd962cd99','resumekey','关键字','char(12)','String','resumekey','0','1','1','1','0','0','=','input','',NULL,260,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('b9e1ff1eb29b464c959644ac72660872','1c68860c5701474788d4627b05281a24','latitude','地理位置纬度','varchar(200)','String','latitude','0','1','1','1','0','0','=','input','',NULL,40,'1','2016-07-18 20:40:48','1','2016-07-18 20:40:48',NULL,'0'),('b9e77f1d34aa46fab6b47d9b0734ea08','341adfbbd1894a089be1196396428e20','stature','身高','int(11)','String','stature','0','1','1','1','0','0','=','input','',NULL,280,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('ba4fe609fb2b4ef3a21d5777dafee4d6','4146c299178d44dfb125f9637179fd9c','lastlogintime','lastlogintime','int(10) unsigned','String','lastlogintime','0','0','1','1','0','0','=','input','',NULL,120,'1','2016-07-19 11:00:49','1','2016-07-19 11:00:49',NULL,'1'),('baec899f2a2140a299a3150e7bcc9748','3d721d0d5c424b5fac3c1ab702cfaf77','fpnation','公司电话','char(5)','String','fpnation','0','1','1','1','0','0','=','input','',NULL,180,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('bb1256a8d1b741f6936d8fed06f45eed','f6e4dafaa72f4c509636484715f33a96','update_by','更新者','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.User','updateBy.id','0','0','1','1','0','0','=','input',NULL,NULL,8,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('bcf5b519d3994b718671d5831768754b','229400ebd07249a6815a37ee0dce4710','status','状态','char(1)','String','status','0','0','1','1','0','0','=','select','yes_no',NULL,240,'1','2016-07-21 17:20:40','1','2016-07-21 17:20:40',NULL,'1'),('bd967d5ec26743bda13f7355c8246270','341adfbbd1894a089be1196396428e20','work_year','工作年限','int(11)','String','workYear','0','1','1','1','0','0','=','input','',NULL,90,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('bdc0e5f22cb345d48eef2a8b15e66c5f','3d721d0d5c424b5fac3c1ab702cfaf77','birthday','出生日期','varchar(12)','String','birthday','0','1','1','1','0','0','=','dateselect','',NULL,50,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('be2de49345314fc58dbafb74458c247b','3d721d0d5c424b5fac3c1ab702cfaf77','idnumber','证件号','varchar(25)','String','idnumber','0','1','1','1','0','0','=','input','',NULL,110,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('bf1e31640e7b4c41b0226fdebed311f2','dbd4126e43eb4978b1e3099e920b4416','remarks','备注信息','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,100,'1','2016-08-01 17:50:52','1','2016-08-01 17:56:14',NULL,'0'),('c059c955cf3e4d019f7dc5bcb3c2251f','3d721d0d5c424b5fac3c1ab702cfaf77','hukou','户口','varchar(150)','String','hukou','0','1','1','1','0','0','=','input','',NULL,250,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('c15af57fbc1e46d98011e139da7e2a3c','1e4e3d1a4a61423a86949011843ec4ed','create_by','创建者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','1','1','0','0','0','=','input','',NULL,40,'1','2016-07-19 11:04:55','1','2016-07-19 11:04:55',NULL,'1'),('c280c4a2c4f84dcc9d6d017386d10410','6a1f05b34c3a46a6b0ef42f09c4271c8','create_date','创建时间','datetime','java.util.Date','createDate','0','1','1','0','0','0','=','dateselect','',NULL,160,'1','2016-07-18 19:41:42','1','2016-07-18 19:41:42',NULL,'0'),('c4393ff3fd4d4640b867bb34fc25e7a1','1c68860c5701474788d4627b05281a24','location_x','location_x','varchar(200)','String','locationX','0','1','1','1','0','0','=','input','',NULL,60,'1','2016-07-18 20:40:48','1','2016-07-18 20:40:48',NULL,'0'),('c58f95b11c98450b86816e7783e2b6d2','1e4e3d1a4a61423a86949011843ec4ed','create_date','创建时间','datetime','java.util.Date','createDate','0','1','1','0','0','0','=','dateselect','',NULL,50,'1','2016-07-19 11:04:55','1','2016-07-19 11:04:55',NULL,'1'),('c62de2d469a04817855dd3791ae07f09','341adfbbd1894a089be1196396428e20','name','姓名','varchar(20)','String','name','0','1','1','1','1','1','like','input','',NULL,20,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('c6bb63724b834ba69c0f50e3e6e145d0','3d721d0d5c424b5fac3c1ab702cfaf77','year_of_birthday','出生日期-年','char(4)','String','yearOfBirthday','0','1','1','1','0','0','=','input','',NULL,60,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('c6c815d39a624f0c9491cd71beb74010','229400ebd07249a6815a37ee0dce4710','resumekey','关键字','char(12)','String','resumekey','0','1','1','1','0','0','=','input','',NULL,150,'1','2016-07-21 17:20:40','1','2016-07-21 17:20:40',NULL,'1'),('c6c9626504174d52b7b0b96865a0d7e4','341adfbbd1894a089be1196396428e20','resumekey','关键字','char(12)','String','resumekey','0','1','1','1','0','0','=','input','',NULL,260,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('c6d584b5fbad4413ad78978bc0b8be6a','c3d9205399914896b72fea6cd962cd99','birthday','出生日期','varchar(12)','String','birthday','0','1','1','1','0','0','=','dateselect','',NULL,50,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('c6da1c6e9a664f48a3058d8f90ca8b43','229400ebd07249a6815a37ee0dce4710','student_group','工作经验','int(11)','String','studentGroup','0','1','1','1','0','0','=','input','',NULL,230,'1','2016-07-21 17:20:40','1','2016-07-21 17:20:40',NULL,'1'),('c75208cbc4a942bdac506289e7ee5110','4146c299178d44dfb125f9637179fd9c','truename','truename','char(15)','String','truename','0','0','1','1','0','0','=','input','',NULL,50,'1','2016-07-19 11:00:49','1','2016-07-19 11:00:49',NULL,'1'),('c9b865d1b9e54e15b22bf579c6c28a5b','6a1f05b34c3a46a6b0ef42f09c4271c8','city','用户所在城市','varchar(200)','String','city','0','1','1','1','0','0','=','input','',NULL,60,'1','2016-07-18 19:41:42','1','2016-07-18 19:41:42',NULL,'0'),('ca42c157c16249dc82c08ee94d375d9e','341adfbbd1894a089be1196396428e20','currtype','币种','int(11)','String','currtype','0','1','1','1','0','0','=','input','',NULL,150,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('ca68a2d403f0449cbaa1d54198c6f350','43d6d5acffa14c258340ce6765e46c6f','office_id','归属部门','varchar2(64)','com.thinkgem.jeesite.modules.modules.sys.entity.Office','office.id|name','0','1','1','1','0','0','=','officeselect',NULL,NULL,3,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('cb6fc67c0fca42f9a87a56dee0099a60','667b900e55b04031bd25301c0589bdf2','id','用户的标识，对当前公众号唯一','varchar(200)','String','id','1','0','1','0','0','0','=','input','',NULL,10,'1','2016-07-19 11:16:43','1','2016-07-19 11:16:43',NULL,'1'),('cb9c0ec3da26432d9cbac05ede0fd1d0','43d6d5acffa14c258340ce6765e46c6f','remarks','备注信息','nvarchar2(255)','String','remarks','0','1','1','1','1','0','=','textarea',NULL,NULL,12,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('ccc8dde0f94f4291bb0207ca07d9be84','667b900e55b04031bd25301c0589bdf2','remarks','备注信息','varchar(255)','String','remarks','0','1','1','1','1','0','=','textarea','',NULL,90,'1','2016-07-19 11:16:43','1','2016-07-19 11:16:43',NULL,'1'),('cdeec6e5d71d4944a96985a53bc1cb4c','c3d9205399914896b72fea6cd962cd99','fpnumber','公司电话-总机号码','char(20)','String','fpnumber','0','1','1','1','0','0','=','input','',NULL,200,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('ceaea425163c42349fa4e8908f8d384d','4146c299178d44dfb125f9637179fd9c','phone','phone','char(15)','String','phone','0','0','1','1','0','0','=','input','',NULL,40,'1','2016-07-19 11:00:49','1','2016-07-19 11:00:49',NULL,'1'),('cf143ce0f53c4d7bba6dfb7c6099b6cc','229400ebd07249a6815a37ee0dce4710','hukou','户口','varchar(150)','String','hukou','0','1','1','1','0','0','=','input','',NULL,140,'1','2016-07-21 17:20:40','1','2016-07-21 17:20:40',NULL,'1'),('cfcfa06ea61749c9b4c4dbc507e0e580','f6e4dafaa72f4c509636484715f33a96','id','编号','varchar2(64)','String','id','1','0','1','0','0','0','=','input',NULL,NULL,1,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('cff42372e14a4ab189e01065005c946b','341adfbbd1894a089be1196396428e20','hpnation','家庭电话','char(5)','String','hpnation','0','1','1','1','0','0','=','input','',NULL,220,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('d0c820a84c444c8daf8278e8127594a2','3d721d0d5c424b5fac3c1ab702cfaf77','fpnumber','公司电话-总机号码','char(20)','String','fpnumber','0','1','1','1','0','0','=','input','',NULL,200,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('d35fbac0487e411f9452d20692d35d0c','1c68860c5701474788d4627b05281a24','create_by','创建者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','createBy.id','0','1','1','0','0','0','=','input','',NULL,80,'1','2016-07-18 20:40:48','1','2016-07-18 20:40:48',NULL,'0'),('d3b92e901c9840539dd25454fdc82239','229400ebd07249a6815a37ee0dce4710','address','地址','varchar(150)','String','address','0','1','1','1','0','0','=','input','',NULL,220,'1','2016-07-21 17:20:40','1','2016-07-21 17:20:40',NULL,'1'),('d461cd8d31ff447191d9cf1054b90a9e','667b900e55b04031bd25301c0589bdf2','truename','真实姓名','varchar(200)','String','truename','0','1','1','1','0','0','=','input','',NULL,40,'1','2016-07-19 11:16:43','1','2016-07-19 11:16:43',NULL,'1'),('d5c2d932ae904aa8a9f9ef34cd36fb0b','43d6d5acffa14c258340ce6765e46c6f','sex','性别','char(1)','String','sex','0','1','1','1','0','1','=','select','sex',NULL,6,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('d64185f95ab44687a052863c36c7e832','c3d9205399914896b72fea6cd962cd99','hpcity','家庭电话-区号','char(5)','String','hpcity','0','1','1','1','0','0','=','input','',NULL,230,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('dfaec55ccdff4efeb9b855348da15a00','229400ebd07249a6815a37ee0dce4710','marrige','婚姻状况','int(11)','String','marrige','0','1','1','1','0','0','=','input','',NULL,170,'1','2016-07-21 17:20:40','1','2016-07-21 17:20:40',NULL,'1'),('e3b6d072b58e47fd8d076ccd4dd158c9','229400ebd07249a6815a37ee0dce4710','card_type','证件类型','int(11)','String','cardType','0','1','1','1','0','0','=','select','card_type',NULL,70,'1','2016-07-21 17:20:40','1','2016-07-21 17:20:40',NULL,'1'),('e3ca0ac131594048ba791867fab1c233','1e4e3d1a4a61423a86949011843ec4ed','update_by','更新者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','1','1','1','0','0','=','input','',NULL,60,'1','2016-07-19 11:04:55','1','2016-07-19 11:04:55',NULL,'1'),('e506753ed54346019ccbc339bcfadd7f','c3d9205399914896b72fea6cd962cd99','fpcity','公司电话-区号','char(5)','String','fpcity','0','1','1','1','0','0','=','input','',NULL,190,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('e5f4e4a7c48943eb80208273d4f6c01b','c3d9205399914896b72fea6cd962cd99','stature','身高','int(11)','String','stature','0','1','1','1','0','0','=','input','',NULL,280,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('e6315f8c05fb487eadb58bda2233aa4d','1e4e3d1a4a61423a86949011843ec4ed','update_date','更新时间','datetime','java.util.Date','updateDate','0','1','1','1','1','0','=','dateselect','',NULL,70,'1','2016-07-19 11:04:55','1','2016-07-19 11:04:55',NULL,'1'),('e64050a2ebf041faa16f12dda5dcf784','6e05c389f3c6415ea34e55e9dfb28934','name','名称','nvarchar2(100)','String','name','0','1','1','1','1','1','like','input',NULL,NULL,3,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('e779d5d8aac542bd8ba06e89f599d94e','1c68860c5701474788d4627b05281a24','update_by','更新者','varchar(64)','com.thinkgem.jeesite.modules.sys.entity.User','updateBy.id','0','1','1','1','0','0','=','input','',NULL,100,'1','2016-07-18 20:40:48','1','2016-07-18 20:40:48',NULL,'0'),('e86b8652124d4a9c9dae918a9a04c4a0','6a1f05b34c3a46a6b0ef42f09c4271c8','sex','用户的性别，值为1时是男性，值为2时是女性，值为0时是未知','varchar(200)','String','sex','0','1','1','1','0','0','=','input','',NULL,50,'1','2016-07-18 19:41:42','1','2016-07-18 19:41:42',NULL,'0'),('e8d11127952d4aa288bb3901fc83127f','43d6d5acffa14c258340ce6765e46c6f','del_flag','删除标记（0：正常；1：删除）','char(1)','String','delFlag','0','0','1','0','0','0','=','radiobox','del_flag',NULL,13,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('e99263a3c8694b0cbdcd16159c9d58ea','341adfbbd1894a089be1196396428e20','card_type','证件类型','int(11)','String','cardType','0','1','1','1','0','0','=','input','',NULL,100,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('eb2e5afd13f147a990d30e68e7f64e12','aef6f1fc948f4c9ab1c1b780bc471cc2','update_date','更新时间','timestamp(6)','java.util.Date','updateDate','0','0','1','1','1','0','=','dateselect',NULL,NULL,11,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('ec367714a28a424e81812ffe4f1fe0c0','3d721d0d5c424b5fac3c1ab702cfaf77','id','用户的标识，对当前公众号唯一','varchar(200)','String','id','1','0','1','0','0','0','=','input','',NULL,10,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('ec48f1f4f38e4fbe91b9c84a74f182b4','4146c299178d44dfb125f9637179fd9c','regip','regip','char(15)','String','regip','0','0','1','1','0','0','=','input','',NULL,90,'1','2016-07-19 11:00:49','1','2016-07-19 11:00:49',NULL,'1'),('ed6f8087d6d047699adc5fb0a450245d','341adfbbd1894a089be1196396428e20','salary','目前年薪','int(11)','String','salary','0','1','1','1','0','0','=','input','',NULL,140,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('edf307bbea924bc9877ea307df81a430','dbd4126e43eb4978b1e3099e920b4416','week','星期','varchar(64)','String','week','0','0','1','1','0','0','=','input','',NULL,30,'1','2016-08-01 17:50:52','1','2016-08-01 17:56:14',NULL,'0'),('ef6cc366d2a54d1bbc7336997b52dbc8','3d721d0d5c424b5fac3c1ab702cfaf77','work_year','工作年限','int(11)','String','workYear','0','1','1','1','0','0','=','input','',NULL,90,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('f134763f93b040489ee80da3ddd05860','1e4e3d1a4a61423a86949011843ec4ed','phone','手机号','varchar(200)','String','phone','0','1','1','1','0','0','=','input','',NULL,20,'1','2016-07-19 11:04:55','1','2016-07-19 11:04:55',NULL,'1'),('f1b737bd68644de2a8a493ef2f159d3a','341adfbbd1894a089be1196396428e20','zip_code','邮编','char(6)','String','zipCode','0','1','1','1','0','0','=','input','',NULL,310,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('f3a1338a65fd43e480bc35b1a378bfb1','341adfbbd1894a089be1196396428e20','idnumber','证件号','varchar(25)','String','idnumber','0','1','1','1','0','0','=','input','',NULL,110,'1','2016-07-21 15:47:09','1','2016-07-21 15:47:09',NULL,'1'),('f428612326264a0482651a834b9bc83d','1c68860c5701474788d4627b05281a24','id','编号','varchar(64)','String','id','1','0','1','0','0','0','=','input','',NULL,10,'1','2016-07-18 20:40:48','1','2016-07-18 20:40:48',NULL,'0'),('f4a9d305b9c944d3a9357d40eaa4d119','1c68860c5701474788d4627b05281a24','status','状态','char(1)','String','status','0','0','1','1','0','0','=','input','',NULL,130,'1','2016-07-18 20:40:48','1','2016-07-18 20:40:48',NULL,'0'),('f4e65bd730154099a25761073d3f72aa','dbd4126e43eb4978b1e3099e920b4416','clock_out','下班打卡','varchar(64)','String','clockOut','0','1','1','1','0','0','=','input','',NULL,50,'1','2016-08-01 17:50:52','1','2016-08-01 17:56:14',NULL,'0'),('f543e02fbec64893835763daf0aa01f0','c3d9205399914896b72fea6cd962cd99','marrige','婚姻状况','int(11)','String','marrige','0','1','1','1','0','0','=','input','',NULL,290,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('f599cca8168145d58a115f062cf64209','4146c299178d44dfb125f9637179fd9c','lastloginip','lastloginip','int(10)','String','lastloginip','0','0','1','1','0','0','=','input','',NULL,110,'1','2016-07-19 11:00:49','1','2016-07-19 11:00:49',NULL,'1'),('f59ec7875fc441d9b2f8ab51d2f9527d','c3d9205399914896b72fea6cd962cd99','location','居住地','varchar(150)','String','location','0','1','1','1','0','0','=','input','',NULL,120,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('f5d9264b3c0348c1925a349291acb262','229400ebd07249a6815a37ee0dce4710','email','email','varchar(80)','String','email','0','1','1','1','0','0','=','input','',NULL,100,'1','2016-07-21 17:20:40','1','2016-07-21 17:20:40',NULL,'1'),('f5ed8c82bad0413fbfcccefa95931358','f6e4dafaa72f4c509636484715f33a96','remarks','备注信息','nvarchar2(255)','String','remarks','0','1','1','1','1','0','=','textarea',NULL,NULL,10,'1','2013-08-12 13:10:05','1','2013-08-12 13:10:05',NULL,'0'),('f7761d6f40b147e09a938cdb0918f092','1c68860c5701474788d4627b05281a24','create_date','创建时间','datetime','java.util.Date','createDate','0','1','1','0','0','0','=','dateselect','',NULL,90,'1','2016-07-18 20:40:48','1','2016-07-18 20:40:48',NULL,'0'),('f95c472c6dae4e779081aaceedd2d45d','229400ebd07249a6815a37ee0dce4710','id','用户的标识，对当前公众号唯一','varchar(200)','String','id','1','0','1','0','0','0','=','input','',NULL,10,'1','2016-07-21 17:20:40','1','2016-07-21 17:20:40',NULL,'1'),('f9ad45d4f07d40bf915115bb5a1add94','3d721d0d5c424b5fac3c1ab702cfaf77','card_type','证件类型','int(11)','String','cardType','0','1','1','1','0','0','=','input','',NULL,100,'1','2016-07-21 16:32:44','1','2016-07-21 16:32:44',NULL,'1'),('fa47b1c34e0248139a3fe4fe01e4125d','c3d9205399914896b72fea6cd962cd99','day_of_birthday','出生日期-日','char(2)','String','dayOfBirthday','0','1','1','1','0','0','=','input','',NULL,80,'1','2016-07-21 16:25:48','1','2016-07-21 16:25:48',NULL,'1'),('fe58c2d0d9294262a536feb463184918','6a1f05b34c3a46a6b0ef42f09c4271c8','groupid','用户所在的分组ID（兼容旧的用户分组接口）','varchar(200)','String','groupid','0','1','1','1','0','0','=','input','',NULL,140,'1','2016-07-18 19:41:42','1','2016-07-18 19:41:42',NULL,'0');
/*!40000 ALTER TABLE `gen_table_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gen_template`
--

DROP TABLE IF EXISTS `gen_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gen_template` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `name` varchar(200) DEFAULT NULL COMMENT '名称',
  `category` varchar(2000) DEFAULT NULL COMMENT '分类',
  `file_path` varchar(500) DEFAULT NULL COMMENT '生成文件路径',
  `file_name` varchar(200) DEFAULT NULL COMMENT '生成文件名',
  `content` text COMMENT '内容',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记（0：正常；1：删除）',
  PRIMARY KEY (`id`),
  KEY `gen_template_del_falg` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代码模板表';
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
  `id` varchar(200) NOT NULL COMMENT '用户的标识，对当前公众号唯一',
  `date` varchar(64) NOT NULL COMMENT '日期',
  `week` varchar(64) NOT NULL COMMENT '星期',
  `clock_in` varchar(64) DEFAULT '缺勤' COMMENT '上班打卡',
  `clock_out` varchar(64) DEFAULT '缺勤' COMMENT '下班打卡',
  `user_id` varchar(64) NOT NULL COMMENT '所属用户',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hr_qiandao`
--

LOCK TABLES `hr_qiandao` WRITE;
/*!40000 ALTER TABLE `hr_qiandao` DISABLE KEYS */;
INSERT INTO `hr_qiandao` VALUES ('0106c47645c24479a488808070ade586','2016-08-25','星期四','缺勤','缺勤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('03595ef31ec04db7969f543777c0b787','2016-08-04','星期四','缺勤','缺勤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('04960475b96045469c5d3cb9f6d13ef6','2016-08-13','星期六','缺勤','缺勤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('07189e184f18433db20c6b1ea8569450','2016-08-24','星期三','缺勤','缺勤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('07aafa945e5f4a6491bf19b5876c8fc6','2016-08-07','星期日','缺勤','缺勤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('08f9412bd3a441a6929ccca38e918124','2016-08-31','星期三','缺勤','缺勤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('09c537997df34f9b88f36768a0253f5c','2016-08-30','星期二','缺勤','缺勤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('0ad2c578e21847789fdcd1e7d9dfa603','2016-08-18','星期四','缺勤','缺勤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('0b84a7df0c6047b4831d0c5af2f47ec0','2016-08-30','星期二','缺勤','缺勤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('0b958c2ee9a74b6a84bf331b9e5a3856','2016-08-10','星期三','缺勤','缺勤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('0c295e6a3e2840b4989998ea472b9280','2016-08-28','星期日','缺勤','缺勤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('0c44ae52f92342d6a3377f3cb77b41a6','2016-08-21','星期日','缺勤','缺勤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('0cd6c0c1c9724dee893f4cb06434e3a3','2016-08-29','星期一','缺勤','缺勤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('0d238ff959334eb4877c9835dd25e2f0','2016-08-10','星期三','缺勤','缺勤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0'),('0d97e1d9903b457aa55d6dcd3b09cb84','2016-08-05','星期五','缺勤','缺勤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('0de91a9c2a834336a3e2402720342d3f','2016-08-09','星期二','缺勤','缺勤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15',NULL,'0'),('0e0207d3ad554430afcc6766a1a7d85f','2016-08-12','星期五','缺勤','缺勤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('0e499e552eca4a139a1b81b593a73ba2','2016-08-02','星期二','缺勤','缺勤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('0edf07ece5004fff9b778b12eb1a5fce','2016-08-30','星期二','缺勤','缺勤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('0f19ff71681e4c0395f26c6571f6b80b','2016-08-18','星期四','缺勤','缺勤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('0f917e0d8b014ac0ba222d9f7e00c9d8','2016-08-18','星期四','缺勤','缺勤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('107b2bedf3794a78813915723cfe5db2','2016-08-25','星期四','缺勤','缺勤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0'),('1107aaa771f8435f8974943cea1acd89','2016-08-14','星期日','缺勤','缺勤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('11ca4be618b547f789e5b09e3be6b81a','2016-08-21','星期日','缺勤','缺勤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('11feb810d96948dd8d25b05a9168af8c','2016-08-16','星期二','缺勤','缺勤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('1283524a53b24c709181267e76f31e4a','2016-08-25','星期四','缺勤','缺勤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:16','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:16',NULL,'0'),('12d1c218ec3a4697abd0ca27dfe5f9e3','2016-08-22','星期一','缺勤','缺勤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('131edc5abcaa43eb82196e4a14bc0f67','2016-08-04','星期四','缺勤','缺勤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('136052ca5ad34f31b8b5ee559975ae35','2016-08-14','星期日','缺勤','缺勤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0'),('138a7526f98e4488ac5cfdea73274b7b','2016-08-17','星期三','缺勤','缺勤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('147ed988da624eb0be5b4b1af0e8bc5a','2016-08-13','星期六','缺勤','缺勤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('14c0e5616a4f41c4aa01f9579650aa92','2016-08-07','星期日','缺勤','缺勤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('1633780941cd4a97993663ca610a1621','2016-08-31','星期三','缺勤','缺勤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('1643d744274942aa945687d55d8a764b','2016-08-21','星期日','缺勤','缺勤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('1650f8600236456ca9747f8a0f0c0123','2016-08-02','星期二','缺勤','缺勤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('167df560b8cb42f6be27de7d031a2350','2016-08-20','星期六','缺勤','缺勤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('16b9f329de524d2ba1c036f8787c3576','2016-08-19','星期五','缺勤','缺勤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('16f7ce5aca844850868776e8dc9e1281','2016-08-28','星期日','缺勤','缺勤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('18ccb89a69014ffa882be1f5a33219e1','2016-08-13','星期六','缺勤','缺勤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('1926f0ee61f74f8f939e5ce2242cc631','2016-08-12','星期五','缺勤','缺勤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('19272f61f42741408ff298eb72aec8c0','2016-08-30','星期二','缺勤','缺勤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('19646b54cbec44f5a1fedb357b2ac3a5','2016-08-17','星期三','缺勤','缺勤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0'),('198871c376cc4d408fbf81b45cb3b13e','2016-08-23','星期二','缺勤','缺勤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('19ff4c7243b24acb8835542686cc95a5','2016-08-21','星期日','缺勤','缺勤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('1a2b2241c94344a1b6b7042393ec59aa','2016-08-07','星期日','缺勤','缺勤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('1a439c9e34924d5eb3d10319167a77c6','2016-08-06','星期六','缺勤','缺勤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('1a8ff293e22d42ac93a9371b56e1403b','2016-08-29','星期一','缺勤','缺勤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:16','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:16',NULL,'0'),('1b2e28dca02245ec863489529aa8a4ff','2016-08-18','星期四','缺勤','缺勤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0'),('1b44c06d57ed46fe8b8d2c8d28bb465b','2016-08-13','星期六','缺勤','缺勤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('1b7123fb7e8c4435a585f746f34ac4d9','2016-08-13','星期六','缺勤','缺勤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15',NULL,'0'),('1ba6d47541444147bbcfd84a13da74ae','2016-08-20','星期六','缺勤','缺勤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('1c3d21286fe64d1b8abd35d621bb95c9','2016-08-12','星期五','缺勤','缺勤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('1c44273ee70f4b93a83ede7a3c2e5343','2016-08-04','星期四','17:14:32','17:14:32','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15','5cbc0c90dca846b88ab0b8a547006df2','2016-08-04 17:14:32',NULL,'0'),('1d737a697aa5408e9a1a37ed6e014230','2016-08-30','星期二','缺勤','缺勤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('1de8230194324636939325cf454ab882','2016-08-09','星期二','缺勤','缺勤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('1ea0a3dc37ef4eba81ea49e585a4b616','2016-08-15','星期一','缺勤','缺勤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('1fc275b3757d404fa2b5fbe69f012ebb','2016-08-12','星期五','缺勤','缺勤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15',NULL,'0'),('1fd73ea081b240eb9bef20e7c5115696','2016-08-20','星期六','缺勤','缺勤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('203cf76aa915458c85f8708d2170dab8','2016-08-04','星期四','缺勤','缺勤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('2225496b32c54b87a61d031fccd63d80','2016-08-20','星期六','缺勤','缺勤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('22326430a9cf4483a56fd7e3dfa131d6','2016-08-11','星期四','缺勤','缺勤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('223c3e2cb37b443c98777ec0abfba513','2016-08-08','星期一','缺勤','缺勤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0'),('23debfeee322401b941dbdd29a72fcae','2016-08-06','星期六','缺勤','缺勤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('23eab44662a54623abad101487b3590b','2016-08-20','星期六','缺勤','缺勤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('2423fc6909de41f88008e8bfc0ca118c','2016-08-18','星期四','缺勤','缺勤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('2472b26283324278b962e1a901f2c2bc','2016-08-14','星期日','缺勤','缺勤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15',NULL,'0'),('24a82a2092d54c1998db0d3324078db0','2016-08-27','星期六','缺勤','缺勤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('254a80a0e036467ab8af1961aec8c548','2016-08-20','星期六','缺勤','缺勤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('2551d5467a2146d59ad7fcb97ed85325','2016-08-19','星期五','缺勤','缺勤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('25b6236c15df4a08a6c37128f3c8c715','2016-08-15','星期一','缺勤','缺勤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('26e6508913c346eb868a29a17eaed6d1','2016-08-13','星期六','缺勤','缺勤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('27c58eff9623432c9bc3baac97440b45','2016-08-16','星期二','缺勤','缺勤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('27f21109c7f6453e8ea1184f7d79f2fc','2016-08-21','星期日','缺勤','缺勤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('28e3974696364ee280c6cc6459cff869','2016-08-29','星期一','缺勤','缺勤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('2a9260d2b39b4f7e9d8695453564199a','2016-08-03','星期三','缺勤','缺勤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('2b32dbc8d2e24889b05f8feffee09f2e','2016-08-16','星期二','缺勤','缺勤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('2bb1b7b8135b4d6ea58259b02d79ac4d','2016-08-31','星期三','缺勤','缺勤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('2c91c73857da4ddd85883cc40742ae4c','2016-08-14','星期日','缺勤','缺勤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('2e6180189c774bab98401d0bfe67cda3','2016-08-21','星期日','缺勤','缺勤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0'),('2e79275cfc2342d6aecdaf16b059c049','2016-08-04','星期四','19:39:39','19:39:39','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:17','7cfec60bc9c947f284bff8a0247fb500','2016-08-04 19:39:40',NULL,'0'),('2f2660e7cc794703b213ab515d3e7b5e','2016-08-14','星期日','缺勤','缺勤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('2fa04a1a29464bd999e776588b75ca4b','2016-08-19','星期五','缺勤','缺勤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('2ffac67afcef44e7b5ba4ee5acf97bdc','2016-08-10','星期三','缺勤','缺勤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('3089abdf67184d36a773ecc08504cafa','2016-08-05','星期五','缺勤','缺勤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('30a837fa5cd84095a2bf343f716ffa25','2016-08-09','星期二','缺勤','缺勤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('3333057fcb124f2bac5676cbf4eee673','2016-08-10','星期三','缺勤','缺勤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('333e912afc2e47f4bc4632c2f6c0e691','2016-08-08','星期一','缺勤','缺勤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('3342f2c634c64ce9bd2363a28d3788e3','2016-08-14','星期日','缺勤','缺勤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('344634a9d57f43859f5d2dbe2099a4a0','2016-08-05','星期五','缺勤','缺勤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:17','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:17',NULL,'0'),('348d23ac261246b7a106c6e734d44715','2016-08-10','星期三','缺勤','缺勤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('34d931c922034b589c4b6497f7495316','2016-08-30','星期二','缺勤','缺勤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('350766f398184824a66ccd596bdf11ba','2016-08-23','星期二','缺勤','缺勤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('356ede79ced84ef0bfbab5a1fafb5e2a','2016-08-29','星期一','缺勤','缺勤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('382e6e1fb44a4c9096ab93eeab8e000e','2016-08-25','星期四','缺勤','缺勤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('3a1629d971f6411aa811f05163a0a00d','2016-08-24','星期三','缺勤','缺勤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0'),('3b375cf0f80f455c8e3bf656d22ea65d','2016-08-20','星期六','缺勤','缺勤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0'),('3b5c598c58af4d73896517d628bf6064','2016-08-26','星期五','缺勤','缺勤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('3bbe82ec54464470bd09ded08e7fb9fd','2016-08-09','星期二','缺勤','缺勤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('3c81244170d145989d82ae01d56fe950','2016-08-28','星期日','缺勤','缺勤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('3ccd3a98fdd3493ca4e5633b0fc3ab30','2016-08-17','星期三','缺勤','缺勤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('3d322b061bf54dc1a4097c1dc5148fb6','2016-08-26','星期五','缺勤','缺勤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('3dde4d6b73344673af2f448044925b8d','2016-08-11','星期四','缺勤','缺勤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('3e0d754863734c1abba9e4623e62751e','2016-08-27','星期六','缺勤','缺勤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('3eb9f4b3563843f898054cbd13e6f4de','2016-08-05','星期五','缺勤','缺勤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('3ef8fabbd75140e4b907288fa3d8c057','2016-08-18','星期四','缺勤','缺勤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('3f21e63825054117ae64e67ce5388d28','2016-08-09','星期二','缺勤','缺勤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('3f30853d3654491990dea6b4c369c569','2016-08-23','星期二','缺勤','缺勤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('4124c02585974a02b3ed3d011b03c37d','2016-08-26','星期五','缺勤','缺勤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('41a7cd8d599843a89bb9f3acfc35dff3','2016-08-17','星期三','缺勤','缺勤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('4329404ceb23401896bcda333ae76ddc','2016-08-19','星期五','缺勤','缺勤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('43ceef07ca884d5192d7eb4e03f5dfab','2016-08-05','星期五','缺勤','缺勤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15',NULL,'0'),('43e9590432144cedbf8903104bdd472a','2016-08-12','星期五','缺勤','缺勤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('459308bc00544c7aa1331bbf4c8d409c','2016-08-20','星期六','缺勤','缺勤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15',NULL,'0'),('463b8f1ef76c45408a846d69c7c69b8f','2016-08-17','星期三','缺勤','缺勤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('463ddf7769a34786a22bec79bcc8c656','2016-08-13','星期六','缺勤','缺勤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('46408c3f5d4a48df9ab616f9bbd69c57','2016-08-27','星期六','缺勤','缺勤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('47085c3df51d4301839e6681e1e8547d','2016-08-22','星期一','缺勤','缺勤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0'),('4748225bf7dc464bb0351e5a8f03d15b','2016-08-28','星期日','缺勤','缺勤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('4752757975154f859bbc44cdd323a823','2016-08-17','星期三','缺勤','缺勤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('478a7516b4a74cc4b379b1dbc88db8f0','2016-08-24','星期三','缺勤','缺勤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('47b8519e58bf4df4b122c96872fe3c82','2016-08-06','星期六','缺勤','缺勤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15',NULL,'0'),('4996a06df8f64dce94c01aa2a375ae9f','2016-08-20','星期六','缺勤','缺勤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('49b50a51c0e44825bf0531953904f9e0','2016-08-26','星期五','缺勤','缺勤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('4a5034fbfe7b48048e3f3dc7b6f723fd','2016-08-02','星期二','缺勤','缺勤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('4ac40c3b7c5c4b1b9698e187f92cd049','2016-08-20','星期六','缺勤','缺勤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('4b9685d7200d47d3b3672551dda178fe','2016-08-12','星期五','缺勤','缺勤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('4ba998b33d594a52ad2c83f793c3a307','2016-08-10','星期三','缺勤','缺勤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('4badae06da3d4aefb1731cc4e4108a64','2016-08-31','星期三','缺勤','缺勤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('4c37960b326e41669e63652d5ab0deea','2016-08-19','星期五','缺勤','缺勤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15',NULL,'0'),('4ca2130e1c194e0fae0ffbc50e99d320','2016-08-27','星期六','缺勤','缺勤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('4cbe283285b0417fbcb9b97353e2169a','2016-08-27','星期六','缺勤','缺勤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:16','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:16',NULL,'0'),('4e485a818f514f87938ea536d21473f3','2016-08-22','星期一','缺勤','缺勤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('4e5e7a156a7440f0bd1cc85fb3540923','2016-08-25','星期四','缺勤','缺勤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('4ec08a1deb784084a2cc60b7e4455575','2016-08-14','星期日','缺勤','缺勤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('4f16868517344326932fc8b230eab724','2016-08-10','星期三','缺勤','缺勤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('4f77e6a4f35645bdb703ace4fc1f6552','2016-08-06','星期六','缺勤','缺勤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('4f7b7be36e7346acbb80fea922fe2235','2016-08-20','星期六','缺勤','缺勤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('4fbdcbcea87a454dbc492bf785321e89','2016-08-07','星期日','缺勤','缺勤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('4fc0f5f906174af9b91781dc008a0142','2016-08-07','星期日','缺勤','缺勤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('506a388b81024d9dab734fb33209fd83','2016-08-24','星期三','缺勤','缺勤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15',NULL,'0'),('50cb1034f76547cdab99f6cefc1ca858','2016-08-09','星期二','缺勤','缺勤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('50eb774d33d4443ba0865dacc794fe95','2016-08-26','星期五','缺勤','缺勤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('518571bf71d74404a3fbe165d5d36cfe','2016-08-21','星期日','缺勤','缺勤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('51b3f2e4319345849edc57e74c9f7351','2016-08-08','星期一','缺勤','缺勤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('51fd64c0853342a9968cfe50ca44c838','2016-08-07','星期日','缺勤','缺勤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('53c8a3877206412b8df2f6a6d25ad306','2016-08-21','星期日','缺勤','缺勤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15',NULL,'0'),('548dc227f7674fa6a1364a936ff1f4c9','2016-08-12','星期五','缺勤','缺勤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('55383cb7b8d84ac3b30485ab56ff7af0','2016-08-26','星期五','缺勤','缺勤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('55ed55eb37a44761b8b1ced299189f37','2016-08-14','星期日','缺勤','缺勤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0'),('56bde624f8914f7db317a0199877c84a','2016-08-07','星期日','缺勤','缺勤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('5760c36c48f64ba1abc6d5d6a0d6f654','2016-08-15','星期一','缺勤','缺勤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0'),('579bc63c07264b1b849c6ecefdaa002c','2016-08-04','星期四','缺勤','缺勤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('58eff7423cad498289ad7625e63ce312','2016-08-28','星期日','缺勤','缺勤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('5951c5c6c8ca49c798a165aadbcec8c0','2016-08-15','星期一','缺勤','缺勤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15',NULL,'0'),('59d1e6538679438c9cb4e4a95ebbd745','2016-08-10','星期三','缺勤','缺勤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('5a097a4b9d6a4af7851e289181a687a7','2016-08-29','星期一','缺勤','缺勤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('5a33d421091f43568dedb0e10016b12d','2016-08-28','星期日','缺勤','缺勤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0'),('5a5f7209889844df8f050cb38d6a2950','2016-08-21','星期日','缺勤','缺勤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('5acc8cd9551a4ea686359f8646c43aea','2016-08-06','星期六','缺勤','缺勤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('5c144e1299b24347aaf68b75f9b09494','2016-08-04','星期四','缺勤','缺勤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('5cf595b64eb94854a2acd7bf12abc136','2016-08-31','星期三','缺勤','缺勤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0'),('5d214083910b4b9bb13cb1bfb423d965','2016-08-09','星期二','缺勤','缺勤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('5d8795e5d88844edbdb8aa971ca8aec7','2016-08-26','星期五','缺勤','缺勤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('5e22721a293f4526812f1aa0c006d6be','2016-08-25','星期四','缺勤','缺勤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('5e7477ca7d2b44a382b0a4c514d2a9c6','2016-08-21','星期日','缺勤','缺勤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('5ed56ea040804371a1490d804801b95e','2016-08-06','星期六','缺勤','缺勤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('5f10b20bffc146dea8a1ab6fc8935bf7','2016-08-31','星期三','缺勤','缺勤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('5f6bfaf7627c47f684dc2bf1a622194a','2016-08-16','星期二','缺勤','缺勤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15',NULL,'0'),('5fb7b4a4b941423c8e55b9e90544b6c8','2016-08-15','星期一','缺勤','缺勤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('60a3f64e6bd24a1b858ddafe7889036a','2016-08-23','星期二','缺勤','缺勤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('61d55e87619448b6b8df1ed3bb29ca63','2016-08-02','星期二','缺勤','缺勤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('63d948ccb36548cc955250e50418590f','2016-08-08','星期一','缺勤','缺勤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('641c1ec619c14ecfba5d217cd8bd6854','2016-08-11','星期四','缺勤','缺勤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('641e38a5d37b4943945429175a320e9c','2016-08-04','星期四','缺勤','缺勤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('6440149f5d584faa8a8079329abc16b1','2016-08-24','星期三','缺勤','缺勤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('646d0a11e74f4c18af0027847ad61d58','2016-08-19','星期五','缺勤','缺勤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0'),('64babf5eda364b92937308592e9c5051','2016-08-02','星期二','缺勤','缺勤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('65212f5861864cac8191d08043857d39','2016-08-31','星期三','缺勤','缺勤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('6554f8491e00417dae7497586e10f05e','2016-08-30','星期二','缺勤','缺勤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0'),('65e7549562484d2a8881cc22c82b94e0','2016-08-27','星期六','缺勤','缺勤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('6813c86dc2b1487da58f23e8ea00c4ea','2016-08-15','星期一','缺勤','缺勤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('68b2df4e4c2a4eec83fb3012e10ddd32','2016-08-10','星期三','缺勤','缺勤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0'),('699cce35216f482e80f673662f7f107b','2016-08-21','星期日','缺勤','缺勤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('6a522f651c01438fb6b8b1c9c24d0197','2016-08-27','星期六','缺勤','缺勤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0'),('6aa515ee84b34a61ad6f4b9419394491','2016-08-16','星期二','缺勤','缺勤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('6b3dcaff21e34bb8b50e1d60d25ef8fc','2016-08-05','星期五','缺勤','缺勤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('6b78bf6fe651443982ad208ceba0c657','2016-08-03','星期三','缺勤','缺勤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('6ca8e45984f94dc683f2060708b06b9c','2016-08-23','星期二','缺勤','缺勤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('6d8e28bf844b4ea1aaf58f4c93a1942f','2016-08-15','星期一','缺勤','缺勤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('6d959a9cbd0a4336bbad27a8479b1666','2016-08-14','星期日','缺勤','缺勤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('6e7729b0aeeb4b7fb6efb951ff24d087','2016-08-30','星期二','缺勤','缺勤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('6ee330d515e94a43892f9074d8b6a013','2016-08-23','星期二','缺勤','缺勤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15',NULL,'0'),('6efb45fb632f485f841f8d5245c24fe0','2016-08-03','星期三','缺勤','缺勤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('6f60224dd99a4b42ad9b97b4b0984d0e','2016-08-11','星期四','缺勤','缺勤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15',NULL,'0'),('6f7228c2f8fe4148961d96e692ff23c8','2016-08-10','星期三','缺勤','缺勤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('6f977b417a294d5ea6b3523b6c6bd93b','2016-08-23','星期二','缺勤','缺勤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('71129336ed144f65843399abb715ced9','2016-08-30','星期二','缺勤','缺勤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:16','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:16',NULL,'0'),('7133671f3353430ba26a4c4d0fe31eca','2016-08-18','星期四','缺勤','缺勤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('717d4889ffc543c1be2d6cd6691738d3','2016-08-25','星期四','缺勤','缺勤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('719fb72364244baa9ad720a9d84cff61','2016-08-29','星期一','缺勤','缺勤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('7212d1210c804f708b12eb46aa14aeee','2016-08-09','星期二','缺勤','缺勤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('727082c52bcc4850bde980573cf8d56b','2016-08-14','星期日','缺勤','缺勤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('72ca16fe03ca48368ed3785cc936bb54','2016-08-13','星期六','缺勤','缺勤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('736adc4ff2834401a3266bef52ea7922','2016-08-26','星期五','缺勤','缺勤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('739d81a66180437bab6353a8f452c39b','2016-08-27','星期六','缺勤','缺勤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('7406e8272edd485c896a219e21e3307e','2016-08-09','星期二','缺勤','缺勤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0'),('743130aa7adc4e15a5e49b5c9862fc34','2016-08-29','星期一','缺勤','缺勤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('74976dea46b34af490ca8b81c4343183','2016-08-08','星期一','缺勤','缺勤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('749c6baa3aed4c3f8170655d91138265','2016-08-15','星期一','缺勤','缺勤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('76ecaf0702bc47929e2e0c744d1dbb5f','2016-08-28','星期日','缺勤','缺勤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('76fd2736d4004a37aaf3f38e80acf222','2016-08-05','星期五','缺勤','缺勤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('77e306f46dbb48098e9a4491519f6a24','2016-08-25','星期四','缺勤','缺勤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('77feabbead594a3f95fbd74b4bcd3af8','2016-08-29','星期一','缺勤','缺勤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0'),('78dcfefad5c040da96025813d22d4219','2016-08-29','星期一','缺勤','缺勤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('79e998d67e684f2a9048a1508b154a92','2016-08-19','星期五','缺勤','缺勤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('7a4366e7e20941f5b8fbb8e3c95242b1','2016-08-10','星期三','缺勤','缺勤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('7b4e235148354c5d8384a5f725b4d19b','2016-08-31','星期三','缺勤','缺勤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:16','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:16',NULL,'0'),('7b60abd25994441692644b76e6ceaf14','2016-08-24','星期三','缺勤','缺勤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('7c438568e2e14545a1d8d02ec43a11b5','2016-08-22','星期一','缺勤','缺勤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0'),('7d41e6ebbef34429900d06549e6e4391','2016-08-14','星期日','缺勤','缺勤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('7db1e5ef78224cbea81511da9f965210','2016-08-26','星期五','缺勤','缺勤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('7de94e1716724ffcba632640a189220b','2016-08-14','星期日','缺勤','缺勤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('7e93906a55ce46928fa4e9f0c1be0ba1','2016-08-08','星期一','缺勤','缺勤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('7ecd471063964feab7dd4e6ea005c6d7','2016-08-11','星期四','缺勤','缺勤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('810983b6b47f4c7e9f330a920c9622ff','2016-08-07','星期日','缺勤','缺勤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0'),('813dc23d54474d999dac12cc53741d89','2016-08-06','星期六','缺勤','缺勤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0'),('8160754b721f4cba8adecd504ba54bac','2016-08-06','星期六','缺勤','缺勤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('819e69ba48824dbab84d1068985c30a8','2016-08-22','星期一','缺勤','缺勤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('81ae5e17e88a4136b1bcdc56c6ced516','2016-08-20','星期六','缺勤','缺勤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('82b1b5baf3bc42a587cda9992799cbc8','2016-08-18','星期四','缺勤','缺勤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15',NULL,'0'),('82c8a8b71a184adaa1a69876a015165a','2016-08-02','星期二','缺勤','缺勤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('83573ade0e944f829b72dd3af86fd68c','2016-08-13','星期六','缺勤','缺勤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('83f449623bea498998a5f692cda465be','2016-08-11','星期四','缺勤','缺勤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('84418bb15c994c71b587b2d36a88a883','2016-08-22','星期一','缺勤','缺勤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('85181a79fba3445caad8db1deadc6ee4','2016-08-20','星期六','缺勤','缺勤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('85370660ed5d42bf8e19c8117ac62000','2016-08-02','星期二','14:13:26','14:56:05','1','1','2016-08-02 14:07:07','1','2016-08-02 14:56:06',NULL,'0'),('856f6b94261c4290b2b31256d56ecde1','2016-08-04','星期四','缺勤','缺勤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('867305e04bc04a6d8bf6775e282d3db9','2016-08-03','星期三','缺勤','缺勤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('86a3ee31d685492783e20edea929f49a','2016-08-16','星期二','缺勤','缺勤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('875255678c30488d9cdfdd58d28691f4','2016-08-12','星期五','缺勤','缺勤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('8868a44bca1241b1ae9cc2ea8da57c87','2016-08-12','星期五','缺勤','缺勤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('88d5f960d3214826abbc6acccb6c590c','2016-08-09','星期二','缺勤','缺勤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('88f0f56ae3cd49cea8f953119d291387','2016-08-16','星期二','缺勤','缺勤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0'),('8a199c02752543af8d0f15ba7d632d38','2016-08-24','星期三','缺勤','缺勤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('8a4d118ad6ce4be5a1b679889935cad0','2016-08-03','星期三','缺勤','缺勤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('8b74ee10a4454fada88e432547d76d69','2016-08-02','星期二','缺勤','缺勤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('8b95a897fea048269694bc2ac8d9e002','2016-08-20','星期六','缺勤','缺勤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0'),('8c9835e82eaa494fbf63005ac2accea1','2016-08-17','星期三','缺勤','缺勤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('8cbb1d9a77e843678fee19a96a5d7542','2016-08-31','星期三','缺勤','缺勤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('8d0dbca514704091a37d262c44dd9e78','2016-08-18','星期四','缺勤','缺勤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('8d7a3de088af41f99052ccb18c4d3e1c','2016-08-15','星期一','缺勤','缺勤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0'),('8dec1a77e1a44ca1ae1781ec6102e2f5','2016-08-23','星期二','缺勤','缺勤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('8e129459c2ba431095eb735d17112670','2016-08-18','星期四','缺勤','缺勤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('8e3346cc8e1d4750b3d6677a59d63fe5','2016-08-24','星期三','缺勤','缺勤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('8ee7e69267464df09b14abaa82bf5ef2','2016-08-03','星期三','10:33:11','11:34:17','1','1','2016-08-02 14:07:07','1','2016-08-03 11:34:17',NULL,'0'),('8f6bb82947004af79224b9441eb8acb3','2016-08-31','星期三','缺勤','缺勤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('8f706a12815b47d5905b26f7286c6339','2016-08-02','星期二','缺勤','缺勤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('8fb80be72b614130a17f21822c5f0078','2016-08-26','星期五','缺勤','缺勤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('9024ec817b514073a3d06125310a955e','2016-08-28','星期日','缺勤','缺勤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('90505ba813bf4555a6be0e686a69947f','2016-08-25','星期四','缺勤','缺勤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('90c74aec158047de85aa4f4b593d15fb','2016-08-08','星期一','缺勤','缺勤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('9101a9b01712400bbd94076a0e80f493','2016-08-04','星期四','缺勤','缺勤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('9128948d55414b4f819428e206231e52','2016-08-05','星期五','缺勤','缺勤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0'),('91ca89739d524e488655ae2f60498e29','2016-08-03','星期三','缺勤','缺勤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('925b5ddb751f4669b2c3ea6f7f3678f9','2016-08-13','星期六','缺勤','缺勤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('941926d728a84bf89410311b582682c2','2016-08-02','星期二','缺勤','缺勤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('943958f95d7f4e178acc588467c9c5a1','2016-08-28','星期日','缺勤','缺勤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:16','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:16',NULL,'0'),('954dbb5538fa4bd4930c54679956f44c','2016-08-05','星期五','缺勤','缺勤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('95d4eb4be1fa46258c3222c1884bfcf5','2016-08-17','星期三','缺勤','缺勤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('9623aa45379c445da4cbb11315abd672','2016-08-29','星期一','缺勤','缺勤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('97041c5121d446ad965bb6e09192925b','2016-08-07','星期日','缺勤','缺勤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('9734c7b624b04118977e4d0703567977','2016-08-10','星期三','缺勤','缺勤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('977178ddc9b14583a8a55b1be1d721f3','2016-08-24','星期三','缺勤','缺勤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('9772131d4cd2437da80336440eb42f13','2016-08-24','星期三','缺勤','缺勤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0'),('9861eefe03484a32953f99ad88005aab','2016-08-07','星期日','缺勤','缺勤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15',NULL,'0'),('98af124fe19f46a8bbaf6a1d203dfa69','2016-08-19','星期五','缺勤','缺勤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('9974356ed3c14e57a91ebbfcfa1f48b5','2016-08-08','星期一','缺勤','缺勤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('9a38cf224629491284b9d2601a666230','2016-08-28','星期日','缺勤','缺勤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('9a59bbd3a0bc4f5c8868edd387482298','2016-08-08','星期一','缺勤','缺勤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15',NULL,'0'),('9a84cfb0fa0943c4ae65e49eb0048391','2016-08-06','星期六','缺勤','缺勤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('9b0bd70287c14a07aeb24686a508b714','2016-08-18','星期四','缺勤','缺勤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('9c0da417766e415b943d2ac74f4d7cbb','2016-08-11','星期四','缺勤','缺勤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('9c5ba8880ca54100b59095be51573172','2016-08-29','星期一','缺勤','缺勤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('9c9d491e1ff2470dbdfc230dfd982a27','2016-08-05','星期五','缺勤','缺勤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('9df52cbfdb6c4510951b6e64af0e83ed','2016-08-24','星期三','缺勤','缺勤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('9e5f9747545b458f9428e4a18fbef90b','2016-08-25','星期四','缺勤','缺勤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0'),('9e8a1a0719cd4114bb771603ac1b27ee','2016-08-14','星期日','缺勤','缺勤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('9f9204c8ecd64fe89c6d129dd153736f','2016-08-27','星期六','缺勤','缺勤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('9fddbad0146d4d1eb45c7f4d95ffa6e4','2016-08-12','星期五','缺勤','缺勤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('9ff2231f17954f2482e854e6850be4a8','2016-08-19','星期五','缺勤','缺勤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('a1b8b23ff77540e08f30602f0932e13a','2016-08-10','星期三','缺勤','缺勤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('a2002b708ced427197d00e5ed4fd30b0','2016-08-23','星期二','缺勤','缺勤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('a22b4a1b34e7408296a4d647b5207ca8','2016-08-07','星期日','缺勤','缺勤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0'),('a2a132b64d9e405da2fd473bc0253c2d','2016-08-02','星期二','缺勤','缺勤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('a312b7e21aac43f79135ab1a389909fd','2016-08-07','星期日','缺勤','缺勤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('a3205ea9280b4a7098a0c3e75b155705','2016-08-17','星期三','缺勤','缺勤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('a329f915be294c7c8243dc81d1428cfe','2016-08-21','星期日','缺勤','缺勤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('a3938fcca91846ab9f451b0f1f94f242','2016-08-24','星期三','缺勤','缺勤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('a39499d35ba644719c07ad903b419485','2016-08-18','星期四','缺勤','缺勤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('a42fb4da1fb64eaeaa6197340e2b1000','2016-08-23','星期二','缺勤','缺勤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0'),('a48da441898a4a3180dbe9515a51cbeb','2016-08-20','星期六','缺勤','缺勤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('a5dacca91851474898fda8028f9badce','2016-08-17','星期三','缺勤','缺勤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('a7335f3716554b2f80b08e4231ee8584','2016-08-31','星期三','缺勤','缺勤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('a857991c9c2d43c6a00ae3360f60d47c','2016-08-27','星期六','缺勤','缺勤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0'),('a866e5d28d03434dabd66e0fc12420ce','2016-08-05','星期五','缺勤','缺勤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('a886d06c38934048bda6a354fbd058f9','2016-08-13','星期六','缺勤','缺勤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('a967310c93e24ea3a9db825b7f0185ac','2016-08-24','星期三','缺勤','缺勤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('a979e895012a44f8ae83844fd5969238','2016-08-15','星期一','缺勤','缺勤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('aac1e6748d424cdfa222c0e6d6e45946','2016-08-24','星期三','缺勤','缺勤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('aad48143fd574863b1896152a82745b0','2016-08-25','星期四','缺勤','缺勤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('ac65e6644f5340c6b76bd6c84c7960af','2016-08-27','星期六','缺勤','缺勤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('ac7766138d7d42938dd74cfa3f9d74ec','2016-08-16','星期二','缺勤','缺勤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('ac7bb6333d1d4042a1a65547e7214dd2','2016-08-08','星期一','缺勤','缺勤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('acb0c3cc6f1849b59d67ae58bd8b4a3d','2016-08-27','星期六','缺勤','缺勤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('acd1a695df964322a0e34bf92c747518','2016-08-27','星期六','缺勤','缺勤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('aeeed29565194f629610bc4c9940eac2','2016-08-24','星期三','缺勤','缺勤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('b07cdc5ded474a4b9e82005345648baa','2016-08-12','星期五','缺勤','缺勤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('b1e26b9ec9944850885941f92a33dcf0','2016-08-08','星期一','缺勤','缺勤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('b2fe21ab03bb411085860cc5c70ce580','2016-08-21','星期日','缺勤','缺勤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('b31aa8a0f2924bdb9899906cd7d6de6e','2016-08-05','星期五','缺勤','缺勤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('b346f69f45c0454cb333025ae6c04049','2016-08-11','星期四','缺勤','缺勤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0'),('b3d334107ac44f68bed91efe1b21f284','2016-08-10','星期三','缺勤','缺勤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15',NULL,'0'),('b466b500042f41b4891fa6a9dc616036','2016-08-11','星期四','缺勤','缺勤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0'),('b4e53156906d485aade4e45ab394be2f','2016-08-12','星期五','缺勤','缺勤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0'),('b5a235260eb94d689efa38a5b112d8df','2016-08-19','星期五','缺勤','缺勤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('b5adb5c5f8494ecb98228d07002b9c9e','2016-08-03','星期三','缺勤','缺勤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('b6150bc048d446cabc7b2e6702b427cf','2016-08-05','星期五','缺勤','缺勤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('b66eac02dfb5474380c7825b156b3567','2016-08-19','星期五','缺勤','缺勤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('b87222694a144d54a613f4182e4d397f','2016-08-25','星期四','缺勤','缺勤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('b8b4fc5f6f3f4a13b60455950a159ae5','2016-08-31','星期三','缺勤','缺勤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0'),('b963653cd6d14154a970ad33915ae5b9','2016-08-25','星期四','缺勤','缺勤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('b9a258d07be9413d800c5912616f055b','2016-08-06','星期六','缺勤','缺勤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('ba2d98339b7f4d58aea0f9970ff0baad','2016-08-29','星期一','缺勤','缺勤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0'),('ba61ac44706047e88ac0015ff33a1a9a','2016-08-17','星期三','缺勤','缺勤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0'),('ba6acd1ac0ae4b518776554e0707581b','2016-08-22','星期一','缺勤','缺勤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('badf03f2484745c7aecfa9fb2a435d0e','2016-08-25','星期四','缺勤','缺勤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('bb5ecef69c2d45dbb99a279fd0613134','2016-08-12','星期五','缺勤','缺勤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('bbf5c031d5934b8fb434a39a87354b7d','2016-08-31','星期三','缺勤','缺勤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('bc2899c7492042b7b15124a30a6d5529','2016-08-07','星期日','缺勤','缺勤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('bc2b456350df4cb094e41188d591c06c','2016-08-05','星期五','缺勤','缺勤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('bcde3ad4c781423e8c191ccb6c13530d','2016-08-14','星期日','缺勤','缺勤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('be01fcea7f0241a49dace37030f3e6b1','2016-08-16','星期二','缺勤','缺勤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('be53c83b905b4e35a6e3e890dae3cd77','2016-08-26','星期五','缺勤','缺勤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0'),('bffd8c6d6ddc48fdba1bf8e8f73c3594','2016-08-05','星期五','缺勤','缺勤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('c022e246e16f4b82b61f8709c9654da4','2016-08-28','星期日','缺勤','缺勤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0'),('c134eb900e364665808a1b3ecbb4b569','2016-08-10','星期三','缺勤','缺勤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('c18c8df74b4f483a859ee6c2e3b67802','2016-08-28','星期日','缺勤','缺勤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('c1f33de577264f41b77012cba6b7c4a7','2016-08-11','星期四','缺勤','缺勤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('c27c64a1d5094949888971c27bc84a84','2016-08-17','星期三','缺勤','缺勤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('c342a38a95b34121a8a8df5aa4b9a236','2016-08-15','星期一','缺勤','缺勤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('c38eb74f4b00494c9dd98606668bde4c','2016-08-06','星期六','缺勤','缺勤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('c3f1d377fac9486386554e61e3454aed','2016-08-26','星期五','缺勤','缺勤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('c3fe3815362845a9a81dcadd7eaa8e07','2016-08-16','星期二','缺勤','缺勤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('c462bbfed3824f07bce72c72e0ab9818','2016-08-06','星期六','缺勤','缺勤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('c4a9454e50c542d5909e25baf3bd6635','2016-08-10','星期三','缺勤','缺勤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('c5e81c2e0fe24425b8d7cecad1dd656c','2016-08-09','星期二','缺勤','缺勤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('c7054be1abf44cd2b1a83b3dd3cd280e','2016-08-14','星期日','缺勤','缺勤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('c735c67beefd43fc8a18ecbe8338c2b5','2016-08-24','星期三','缺勤','缺勤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('c7decab53cec4cc4b1fe38c3c758114c','2016-08-23','星期二','缺勤','缺勤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('c8de75685ce64394b84c55d7d9297bd1','2016-08-22','星期一','缺勤','缺勤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('c984feb1cc5b4dc69cffcd18a04ee16c','2016-08-15','星期一','缺勤','缺勤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('cad9ec5ca27e49faa182161154a8c6cc','2016-08-19','星期五','缺勤','缺勤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('cc9c9fb5703c4500965dd7b64763d299','2016-08-26','星期五','缺勤','缺勤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0'),('cce20f491c344d1aa6d31f412afd2720','2016-08-27','星期六','缺勤','缺勤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('cda1084a37f44c70bb774073d1a8d0e6','2016-08-31','星期三','缺勤','缺勤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('ceef80efb39b4a66b2a213ba2dfd13aa','2016-08-12','星期五','缺勤','缺勤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('cf71c5c0bff145748e271bdb1255686f','2016-08-26','星期五','缺勤','缺勤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:16','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:16',NULL,'0'),('d01fe5ae478b42c7a830a957fc0b8ae6','2016-08-09','星期二','缺勤','缺勤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('d04dddc3039249f69c1c760f5576284f','2016-08-23','星期二','缺勤','缺勤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('d09d1c02d99145009c284deb2f665253','2016-08-30','星期二','缺勤','缺勤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('d0e64be877a843e4975d573b76883325','2016-08-16','星期二','缺勤','缺勤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('d11382342fcd4bebb2184458d42ad04f','2016-08-04','星期四','缺勤','缺勤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('d1a27bc3a160495eaa75eee9ddd9e512','2016-08-15','星期一','缺勤','缺勤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('d252346a8fb948369cf3b4d07fd26bdd','2016-08-04','星期四','缺勤','缺勤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('d301e759433b4daa9c5af1b3d651b44f','2016-08-09','星期二','缺勤','缺勤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('d36b8c89558c40d7b9093df7bf5b11cc','2016-08-07','星期日','缺勤','缺勤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('d57d94f5278548ec9451823b5855062e','2016-08-11','星期四','缺勤','缺勤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('d653aaa9f19b46658e395b99d87e8eac','2016-08-27','星期六','缺勤','缺勤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('d71b2bd491224577ba0ab23db1619a06','2016-08-03','星期三','缺勤','缺勤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('d7938e446ca1426b88951309c4c884d7','2016-08-19','星期五','缺勤','缺勤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('d80e5b9f462e43a3ba51656eeac00dba','2016-08-26','星期五','缺勤','缺勤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('d8bfb2ef09464227ac1dfb3f4b3286ec','2016-08-17','星期三','缺勤','缺勤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('d8ca9169f6a54a87b37d2df6f3fb7258','2016-08-13','星期六','缺勤','缺勤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('d9383313655b47cbaeb1a69dde8cf05d','2016-08-28','星期日','缺勤','缺勤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('d94e036070654e96b1bf52ea56f6384e','2016-08-17','星期三','缺勤','缺勤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('d969fade98654470bdd5d7dbb33854ad','2016-08-03','星期三','14:24:22','15:05:22','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','54b732a7a8dd44c2b6745b64cf9e3e77','2016-08-03 15:05:23',NULL,'0'),('d99b613fc5c840b19271ada3436f0bc7','2016-08-30','星期二','缺勤','缺勤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('da1e597eae864b8e93f53daf9e50d724','2016-08-23','星期二','缺勤','缺勤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('da40ef6f5b024f948e648637a4d4395e','2016-08-17','星期三','缺勤','缺勤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('da57075396c44ddb86a8e92a05d2198e','2016-08-15','星期一','缺勤','缺勤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('dabc36d08470413dae6ae8ebd44f89e2','2016-08-05','星期五','缺勤','缺勤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('dbe3307be0954f49a013a25d88f623d2','2016-08-19','星期五','缺勤','缺勤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('dbeeeb77909d429ca63323bf170c77f9','2016-08-27','星期六','缺勤','缺勤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('dc433943cd0d444fa83156cc10d0031f','2016-08-08','星期一','缺勤','缺勤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('dc450c9610314b358468db0bac718caf','2016-08-29','星期一','缺勤','缺勤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('dcf4bfd923134509aecfc4b70a923c76','2016-08-21','星期日','缺勤','缺勤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('de9ba31690774578b15f69293f9ae96e','2016-08-26','星期五','缺勤','缺勤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('df51081a1f374bd2be0e4d4e60980123','2016-08-28','星期日','缺勤','缺勤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('df940a4bd4004c038a30629bc308f59c','2016-08-06','星期六','缺勤','缺勤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0'),('dfa7fcd7f54b4cbcb7440fc13806e468','2016-08-19','星期五','缺勤','缺勤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0'),('e00fefdfdfdd4027a601c0499b2bc570','2016-08-04','星期四','缺勤','缺勤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('e0a2203169164385bc56adc8880a353e','2016-08-23','星期二','缺勤','缺勤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0'),('e0cd97a129bc417d89c99c4a80227d02','2016-08-11','星期四','缺勤','缺勤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('e0ed0ce3a9ec4635a7e824dd68e9b502','2016-08-18','星期四','缺勤','缺勤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('e0f050090cae468db31e3b94875076f2','2016-08-22','星期一','缺勤','缺勤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('e228e7f693aa42b1b6d72b66a746a6f5','2016-08-28','星期日','缺勤','缺勤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('e33cd17decea475fbef3482a5255e4bf','2016-08-16','星期二','缺勤','缺勤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('e3525b5a10b44057b9f44cbdd1e3ce69','2016-08-21','星期日','缺勤','缺勤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0'),('e372505bece144099dde38584561703a','2016-08-11','星期四','缺勤','缺勤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('e3b5c5b7fdb44568b70183732f339e0c','2016-08-06','星期六','缺勤','缺勤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('e41205b9722a4c99830d1b71bbafea39','2016-08-09','星期二','缺勤','缺勤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0'),('e42a1f69fa894654a99696a742c9da95','2016-08-30','星期二','缺勤','缺勤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('e4df4e1cca0a4a498cf2df4d0fee7ef1','2016-08-21','星期日','缺勤','缺勤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('e51d30f36a254a2e9e02c40ce59baed5','2016-08-25','星期四','缺勤','缺勤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('e5a158bf34e74e55993a206ccc4a7680','2016-08-20','星期六','缺勤','缺勤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('e641b9d9cadb406c90c01a62cfaa50eb','2016-08-08','星期一','缺勤','缺勤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0'),('e6bffd06627545a584f7840c1dca71cf','2016-08-16','星期二','缺勤','缺勤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('e7386d8010964d7c8ba34b15cd81c1cd','2016-08-16','星期二','缺勤','缺勤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('e772bbbbad1e4102a8a4cec85b5a5376','2016-08-16','星期二','缺勤','缺勤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('e80c9dad03da435abd06b495810834a5','2016-08-11','星期四','缺勤','缺勤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('e88a6854cb0f45bd89bbfbb374420005','2016-08-12','星期五','缺勤','缺勤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0'),('e8ab785bc7cc465d8d6137d1f4f4febc','2016-08-16','星期二','缺勤','缺勤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0'),('e8efb6620010445fa3798ff24c393bb7','2016-08-07','星期日','缺勤','缺勤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('e98e68f02140428ea0495e9a0e1e2c6f','2016-08-04','星期四','缺勤','缺勤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('e9b387a09a504bb2a16d6b560cebad33','2016-08-31','星期三','缺勤','缺勤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('ea2e5123797f4dfbb14224eade80a84a','2016-08-18','星期四','缺勤','缺勤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('eb18831221aa49d684126bb06b99512a','2016-08-03','星期三','缺勤','缺勤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('eb1d2391addd4684892d06bc113463f9','2016-08-13','星期六','缺勤','缺勤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('eb57718496214349b44f14472c61915b','2016-08-31','星期三','缺勤','缺勤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('ebbbff65d0834423b526a9929e22b5b5','2016-08-08','星期一','缺勤','缺勤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('ec16dfb267364f6aaaf7789b569cc40c','2016-08-19','星期五','缺勤','缺勤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('ec60357a076d4f1f9e6209dc4c06726e','2016-08-22','星期一','缺勤','缺勤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('ed085e05610042148d50a12aaba9bdc1','2016-08-23','星期二','缺勤','缺勤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('eda85e4f77cb4950a82a05ec7c8743e8','2016-08-03','星期三','缺勤','缺勤','2c9c018166ef48cd8ceb53731a9da45b','1','2016-08-03 11:34:30','1','2016-08-03 11:34:30',NULL,'0'),('ef663cbb61644263b41face20436c72d','2016-08-28','星期日','缺勤','缺勤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('f08759d2cd674f598d0ed9b10eb3825e','2016-08-09','星期二','缺勤','缺勤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('f12c546525ef4d75b0a567333335b15d','2016-08-15','星期一','缺勤','缺勤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('f2623fe1c90e4eeb800dc2862fe17fde','2016-08-03','星期三','缺勤','缺勤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('f296d371408641ffa4e3e43cafccca7a','2016-08-14','星期日','缺勤','缺勤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('f3257a7788df48c9bd4168267e1ca1d3','2016-08-12','星期五','缺勤','缺勤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('f428ea52664b45c786f3533a760d4a3a','2016-08-22','星期一','缺勤','缺勤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('f494c66904384e6fa7b8c697a0dff38a','2016-08-29','星期一','缺勤','缺勤','fa3f7da071f944b698510226f994f5ed','1','2016-08-02 14:35:47','1','2016-08-02 14:35:47',NULL,'0'),('f4d86c6cb168492087fe7017f4c31079','2016-08-30','星期二','缺勤','缺勤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('f5643ed391a24df8b3a1f1eabd1034ee','2016-08-15','星期一','缺勤','缺勤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('f633849487f84a4bb58ca4e1625b3119','2016-08-18','星期四','缺勤','缺勤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0'),('f6737963db4e41d4a3adf2b39053e81e','2016-08-17','星期三','缺勤','缺勤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15',NULL,'0'),('f6a40952587c45689b3efd2530907f5b','2016-08-22','星期一','缺勤','缺勤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('f737b833917c44deb8059ee93d509593','2016-08-08','星期一','缺勤','缺勤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('f745bb9c494e408997129bf14ac9520f','2016-08-29','星期一','缺勤','缺勤','331acc01aa7443cdb2f1e5db85e0996c','1','2016-08-02 14:57:20','1','2016-08-02 14:57:20',NULL,'0'),('f7bdfd5bc9bc45baa2682bee8231ce3c','2016-08-30','星期二','缺勤','缺勤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0'),('f7fae2fa46ac490d915593eb30218fd3','2016-08-04','星期四','缺勤','缺勤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('f80c904bf5824e4ea7b6c3f7b16ed391','2016-08-25','星期四','缺勤','缺勤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('f8ab61e7a50a47d087aa81a53b05b461','2016-08-13','星期六','缺勤','缺勤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('f8be5878d782484b9ca557b4429e69b6','2016-08-11','星期四','缺勤','缺勤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('f8cc05997c3144088f9f580c1c79a044','2016-08-22','星期一','缺勤','缺勤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('f9070aa345714ed8a6979d046f1224fe','2016-08-22','星期一','缺勤','缺勤','5cbc0c90dca846b88ab0b8a547006df2','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15',NULL,'0'),('f994a7003e664e2697a7ca7578135b60','2016-08-30','星期二','缺勤','缺勤','df7714ee986d4ae8ae81864295139673','1','2016-08-02 14:20:33','1','2016-08-02 14:20:33',NULL,'0'),('fb11dbd7836a4593bcff49e20a82407e','2016-08-29','星期一','缺勤','缺勤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('fb392334e4d340198981b572b84d8b28','2016-08-04','星期四','11:03:06','19:50:28','1','1','2016-08-02 14:07:07','1','2016-08-04 19:50:28',NULL,'0'),('fb4fb409ac574fcb8d1e8f4f6d4cce77','2016-08-18','星期四','缺勤','缺勤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('fc096b884aaa44aea07dbc53cd2aa30d','2016-08-06','星期六','缺勤','缺勤','4a461a50611346108ace098fc4b03c92','1','2016-08-02 14:30:04','1','2016-08-02 14:30:04',NULL,'0'),('fc8e693b236e47af893eaa3942e618a9','2016-08-22','星期一','缺勤','缺勤','85469c5f6c314b8fb87301fb19ac08fb','1','2016-08-02 14:36:41','1','2016-08-02 14:36:41',NULL,'0'),('fd125319a8404953a7990a6440970420','2016-08-07','星期日','缺勤','缺勤','54b732a7a8dd44c2b6745b64cf9e3e77','1','2016-08-03 11:36:22','1','2016-08-03 11:36:22',NULL,'0'),('fd4645a66d2244c382ecd33378362507','2016-08-22','星期一','缺勤','缺勤','17f86ad82bbb443383c6ba039d427ec5','1','2016-08-02 14:26:49','1','2016-08-02 14:26:49',NULL,'0'),('fd4eb462e2d04b62810be7ac74b1e0fd','2016-08-11','星期四','缺勤','缺勤','5e37304fb40644d38101875235c9a5b7','1','2016-08-02 14:56:21','1','2016-08-02 14:56:21',NULL,'0'),('fe0ae148ed0443a0b088fcb4a264b5f0','2016-08-13','星期六','缺勤','缺勤','7cfec60bc9c947f284bff8a0247fb500','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0'),('ff503a9fb8f44f40afc8d695e96cb5ac','2016-08-08','星期一','缺勤','缺勤','72a0d38fa2654dea9423391acc251a02','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('ff518862f2dd4c82b3ba85516f3c88e7','2016-08-06','星期六','缺勤','缺勤','ce29a4e3cb1c48cc8404c8d83c84653f','1','2016-08-02 15:02:30','1','2016-08-02 15:02:30',NULL,'0'),('ff5e563be66a44b79c2c0245f5cc5fd1','2016-08-23','星期二','缺勤','缺勤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('ff61002e069e4a9bb4a4afcc2c0c89fd','2016-08-09','星期二','缺勤','缺勤','71473fceee13499680b82e546cea9948','1','2016-08-02 14:58:47','1','2016-08-02 14:58:47',NULL,'0'),('ff8eaf4613af4191a32aa89bf0293a0c','2016-08-30','星期二','缺勤','缺勤','e7330332e49d4015b7209cd722ce9c57','1','2016-08-02 14:51:17','1','2016-08-02 14:51:17',NULL,'0'),('ffc04b0d4f7148bcabaa5b9ed7fbf0d6','2016-08-13','星期六','缺勤','缺勤','1','1','2016-08-02 14:07:07','1','2016-08-02 14:07:07',NULL,'0');
/*!40000 ALTER TABLE `hr_qiandao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hr_resume`
--

DROP TABLE IF EXISTS `hr_resume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hr_resume` (
  `id` varchar(200) NOT NULL COMMENT '用户的标识，对当前公众号唯一',
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `gender` int(11) DEFAULT '0' COMMENT '性别',
  `headimgurl` varchar(200) DEFAULT NULL COMMENT '个人头像',
  `birthday` varchar(60) DEFAULT NULL COMMENT '出生日期',
  `work_year` varchar(20) DEFAULT NULL COMMENT '工作年限',
  `card_type` int(11) DEFAULT NULL COMMENT '证件类型',
  `idnumber` varchar(25) NOT NULL COMMENT '证件号',
  `location` varchar(150) DEFAULT NULL COMMENT '居住地',
  `email` varchar(80) DEFAULT NULL COMMENT 'email',
  `salary` varchar(200) DEFAULT NULL COMMENT '目前年薪',
  `current_situation` varchar(200) DEFAULT NULL COMMENT '求职状态',
  `mobile` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `hukou` varchar(150) DEFAULT NULL COMMENT '户口',
  `resumekey` char(12) DEFAULT NULL COMMENT '关键字',
  `stature` varchar(200) DEFAULT NULL COMMENT '身高',
  `marrige` varchar(200) DEFAULT NULL COMMENT '婚姻状况',
  `qq_talk` varchar(20) DEFAULT NULL COMMENT 'qq号',
  `zip_code` char(6) DEFAULT NULL COMMENT '邮编',
  `ali_talk` varchar(100) DEFAULT NULL COMMENT '旺旺id',
  `home_page` varchar(200) DEFAULT NULL COMMENT '个人主页',
  `address` varchar(150) DEFAULT NULL COMMENT '地址',
  `student_group` varchar(200) DEFAULT NULL COMMENT '工作经验',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态',
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
INSERT INTO `hr_resume` VALUES ('69019c90a7cf46149e7db9450d2ee139','赵俊鹏',1,'','2016-08-04','',0,'230302198402175333','','','','','13552471077','','','','','','','','','','','1','8dc8c943e1bd4c468c34308e9ce6a7eb','WECHAT','null'),('7058770539434fc6ae5e432cbd9d6e88','赵俊飞',1,'/userfiles/head/a50db4ded81a49a683597d490ace2f84.','2016-08-04 16:50:34','',0,'230302198402175312','','','','','18801029695','','','','','','','','','','','1','8dc8c943e1bd4c468c34308e9ce6a7eb','WEB',NULL),('d56eb0c370444679866e717967b3e016','李燕青',1,'','2016-08-01','',0,'230302198402175301','','','','','18801029601','','','','','','','','','','','1','8dc8c943e1bd4c468c34308e9ce6a7eb','WECHAT',NULL);
/*!40000 ALTER TABLE `hr_resume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oa_leave`
--

DROP TABLE IF EXISTS `oa_leave`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `oa_leave` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `process_instance_id` varchar(64) DEFAULT NULL COMMENT '流程实例编号',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `leave_type` varchar(20) DEFAULT NULL COMMENT '请假类型',
  `reason` varchar(255) DEFAULT NULL COMMENT '请假理由',
  `apply_time` datetime DEFAULT NULL COMMENT '申请时间',
  `reality_start_time` datetime DEFAULT NULL COMMENT '实际开始时间',
  `reality_end_time` datetime DEFAULT NULL COMMENT '实际结束时间',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `oa_leave_create_by` (`create_by`),
  KEY `oa_leave_process_instance_id` (`process_instance_id`),
  KEY `oa_leave_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='请假流程表';
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
  `id` varchar(64) NOT NULL COMMENT '编号',
  `type` char(1) DEFAULT NULL COMMENT '类型',
  `title` varchar(200) DEFAULT NULL COMMENT '标题',
  `content` varchar(2000) DEFAULT NULL COMMENT '内容',
  `files` varchar(2000) DEFAULT NULL COMMENT '附件',
  `status` char(1) DEFAULT NULL COMMENT '状态',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `oa_notify_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通知通告';
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
  `id` varchar(64) NOT NULL COMMENT '编号',
  `oa_notify_id` varchar(64) DEFAULT NULL COMMENT '通知通告ID',
  `user_id` varchar(64) DEFAULT NULL COMMENT '接受人',
  `read_flag` char(1) DEFAULT '0' COMMENT '阅读标记',
  `read_date` date DEFAULT NULL COMMENT '阅读时间',
  PRIMARY KEY (`id`),
  KEY `oa_notify_record_notify_id` (`oa_notify_id`),
  KEY `oa_notify_record_user_id` (`user_id`),
  KEY `oa_notify_record_read_flag` (`read_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通知通告发送记录';
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
  `id` varchar(64) NOT NULL COMMENT '编号',
  `PROC_INS_ID` varchar(64) DEFAULT NULL COMMENT '流程实例ID',
  `USER_ID` varchar(64) DEFAULT NULL COMMENT '变动用户',
  `OFFICE_ID` varchar(64) DEFAULT NULL COMMENT '归属部门',
  `POST` varchar(255) DEFAULT NULL COMMENT '岗位',
  `AGE` char(1) DEFAULT NULL COMMENT '性别',
  `EDU` varchar(255) DEFAULT NULL COMMENT '学历',
  `CONTENT` varchar(255) DEFAULT NULL COMMENT '调整原因',
  `OLDA` varchar(255) DEFAULT NULL COMMENT '现行标准 薪酬档级',
  `OLDB` varchar(255) DEFAULT NULL COMMENT '现行标准 月工资额',
  `OLDC` varchar(255) DEFAULT NULL COMMENT '现行标准 年薪总额',
  `NEWA` varchar(255) DEFAULT NULL COMMENT '调整后标准 薪酬档级',
  `NEWB` varchar(255) DEFAULT NULL COMMENT '调整后标准 月工资额',
  `NEWC` varchar(255) DEFAULT NULL COMMENT '调整后标准 年薪总额',
  `ADD_NUM` varchar(255) DEFAULT NULL COMMENT '月增资',
  `EXE_DATE` varchar(255) DEFAULT NULL COMMENT '执行时间',
  `HR_TEXT` varchar(255) DEFAULT NULL COMMENT '人力资源部门意见',
  `LEAD_TEXT` varchar(255) DEFAULT NULL COMMENT '分管领导意见',
  `MAIN_LEAD_TEXT` varchar(255) DEFAULT NULL COMMENT '集团主要领导意见',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `OA_TEST_AUDIT_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='审批流程测试表';
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
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `code` varchar(100) DEFAULT NULL COMMENT '区域编码',
  `type` char(1) DEFAULT NULL COMMENT '区域类型',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_area_parent_id` (`parent_id`),
  KEY `sys_area_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='区域表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_area`
--

LOCK TABLES `sys_area` WRITE;
/*!40000 ALTER TABLE `sys_area` DISABLE KEYS */;
INSERT INTO `sys_area` VALUES ('1','0','0,','中国',10,'100000','1','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','1','0,1,','北京市',20,'110000','2','1','2013-05-27 08:00:00','1','2016-08-02 10:25:11','','0'),('3','2','0,1,2,','济南市',30,'110101','3','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('4','3','0,1,2,3,','历城区',40,'110102','4','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('5','3','0,1,2,3,','历下区',50,'110104','4','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('6','3','0,1,2,3,','高新区',60,'110105','4','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1');
/*!40000 ALTER TABLE `sys_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict`
--

DROP TABLE IF EXISTS `sys_dict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `value` varchar(100) NOT NULL COMMENT '数据值',
  `label` varchar(100) NOT NULL COMMENT '标签名',
  `type` varchar(100) NOT NULL COMMENT '类型',
  `description` varchar(100) NOT NULL COMMENT '描述',
  `sort` decimal(10,0) NOT NULL COMMENT '排序（升序）',
  `parent_id` varchar(64) DEFAULT '0' COMMENT '父级编号',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`label`),
  KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict`
--

LOCK TABLES `sys_dict` WRITE;
/*!40000 ALTER TABLE `sys_dict` DISABLE KEYS */;
INSERT INTO `sys_dict` VALUES ('1','0','正常','del_flag','删除标记',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('10','yellow','黄色','color','颜色值',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('101','com.thinkgem.jeesite.modules.sys.entity.User','User','gen_java_type','Java类型\0\0',60,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('102','com.thinkgem.jeesite.modules.sys.entity.Office','Office','gen_java_type','Java类型\0\0',70,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('103','com.thinkgem.jeesite.modules.sys.entity.Area','Area','gen_java_type','Java类型\0\0',80,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('104','Custom','Custom','gen_java_type','Java类型\0\0',90,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('105','1','会议通告\0\0\0\0','oa_notify_type','通知通告类型',10,'0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('106','2','奖惩通告\0\0\0\0','oa_notify_type','通知通告类型',20,'0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('107','3','活动通告\0\0\0\0','oa_notify_type','通知通告类型',30,'0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('108','0','草稿','oa_notify_status','通知通告状态',10,'0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('109','1','发布','oa_notify_status','通知通告状态',20,'0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('11','orange','橙色','color','颜色值',50,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('110','0','未读','oa_notify_read','通知通告状态',10,'0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('111','1','已读','oa_notify_read','通知通告状态',20,'0','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('12','default','默认主题','theme','主题方案',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('13','cerulean','天蓝主题','theme','主题方案',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('14','readable','橙色主题','theme','主题方案',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('15','united','红色主题','theme','主题方案',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('16','flat','Flat主题','theme','主题方案',60,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('17','1','国家','sys_area_type','区域类型',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('18','2','省份、直辖市','sys_area_type','区域类型',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('19','3','地市','sys_area_type','区域类型',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','1','删除','del_flag','删除标记',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('20','4','区县','sys_area_type','区域类型',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('200','0','身份证','card_type','证件类型',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('201','1','居住证','card_type','证件类型',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('202','2','签证','card_type','证件类型',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('203','3','护照','card_type','证件类型',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('204','4','户口本','card_type','证件类型',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('205','5','军人证','card_type','证件类型',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('206','6','团员证','card_type','证件类型',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('207','7','党员证','card_type','证件类型',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('208','8','港澳通行证','card_type','证件类型',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('21','1','公司','sys_office_type','机构类型',60,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('22','2','部门','sys_office_type','机构类型',70,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('23','3','小组','sys_office_type','机构类型',80,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('24','4','其它','sys_office_type','机构类型',90,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('25','1','综合部','sys_office_common','快捷通用部门',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('26','2','开发部','sys_office_common','快捷通用部门',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('27','3','人力部','sys_office_common','快捷通用部门',50,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('28','1','一级','sys_office_grade','机构等级',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('29','2','二级','sys_office_grade','机构等级',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','1','显示','show_hide','显示/隐藏',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('30','3','三级','sys_office_grade','机构等级',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('31','4','四级','sys_office_grade','机构等级',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('32','1','所有数据','sys_data_scope','数据范围',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('33','2','所在公司及以下数据','sys_data_scope','数据范围',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('34','3','所在公司数据','sys_data_scope','数据范围',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('35','4','所在部门及以下数据','sys_data_scope','数据范围',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('36','5','所在部门数据','sys_data_scope','数据范围',50,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('37','8','仅本人数据','sys_data_scope','数据范围',90,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('38','9','按明细设置','sys_data_scope','数据范围',100,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('39','1','系统管理','sys_user_type','用户类型',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4','0','隐藏','show_hide','显示/隐藏',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('40','2','部门经理','sys_user_type','用户类型',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('41','3','普通用户','sys_user_type','用户类型',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('42','basic','基础主题','cms_theme','站点主题',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('43','blue','蓝色主题','cms_theme','站点主题',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('44','red','红色主题','cms_theme','站点主题',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('45','article','文章模型','cms_module','栏目模型',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('46','picture','图片模型','cms_module','栏目模型',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('47','download','下载模型','cms_module','栏目模型',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('48','link','链接模型','cms_module','栏目模型',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('49','special','专题模型','cms_module','栏目模型',50,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('5','1','是','yes_no','是/否',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('50','0','默认展现方式','cms_show_modes','展现方式',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('51','1','首栏目内容列表','cms_show_modes','展现方式',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('52','2','栏目第一条内容','cms_show_modes','展现方式',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('53','0','发布','cms_del_flag','内容状态',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('54','1','删除','cms_del_flag','内容状态',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('55','2','审核','cms_del_flag','内容状态',15,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('56','1','首页焦点图','cms_posid','推荐位',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('57','2','栏目页文章推荐','cms_posid','推荐位',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('58','1','咨询','cms_guestbook','留言板分类',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('59','2','建议','cms_guestbook','留言板分类',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6','0','否','yes_no','是/否',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('60','3','投诉','cms_guestbook','留言板分类',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('61','4','其它','cms_guestbook','留言板分类',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('62','1','公休','oa_leave_type','请假类型',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('63','2','病假','oa_leave_type','请假类型',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('64','3','事假','oa_leave_type','请假类型',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('65','4','调休','oa_leave_type','请假类型',40,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('66','5','婚假','oa_leave_type','请假类型',60,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('67','1','接入日志','sys_log_type','日志类型',30,'0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('68','2','异常日志','sys_log_type','日志类型',40,'0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('69','leave','请假流程','act_type','流程类型',10,'0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('7','red','红色','color','颜色值',10,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('70','test_audit','审批测试流程','act_type','流程类型',20,'0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('71','1','分类1','act_category','流程分类',10,'0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('72','2','分类2','act_category','流程分类',20,'0','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('73','crud','增删改查','gen_category','代码生成分类',10,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('74','crud_many','增删改查（包含从表）','gen_category','代码生成分类',20,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('75','tree','树结构','gen_category','代码生成分类',30,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('76','=','=','gen_query_type','查询方式',10,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('77','!=','!=','gen_query_type','查询方式',20,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('78','&gt;','&gt;','gen_query_type','查询方式',30,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('79','&lt;','&lt;','gen_query_type','查询方式',40,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('8','green','绿色','color','颜色值',20,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('80','between','Between','gen_query_type','查询方式',50,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('81','like','Like','gen_query_type','查询方式',60,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('82','left_like','Left Like','gen_query_type','查询方式',70,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('83','right_like','Right Like','gen_query_type','查询方式',80,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('84','input','文本框','gen_show_type','字段生成方案',10,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('85','textarea','文本域','gen_show_type','字段生成方案',20,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('86','select','下拉框','gen_show_type','字段生成方案',30,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('87','checkbox','复选框','gen_show_type','字段生成方案',40,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('88','radiobox','单选框','gen_show_type','字段生成方案',50,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('89','dateselect','日期选择','gen_show_type','字段生成方案',60,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('9','blue','蓝色','color','颜色值',30,'0','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('90','userselect','人员选择\0','gen_show_type','字段生成方案',70,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('91','officeselect','部门选择','gen_show_type','字段生成方案',80,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('92','areaselect','区域选择','gen_show_type','字段生成方案',90,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('93','String','String','gen_java_type','Java类型',10,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('94','Long','Long','gen_java_type','Java类型',20,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('95','dao','仅持久层','gen_category','代码生成分类\0\0\0\0\0\0',40,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('96','1','男','sex','性别',10,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'0'),('97','2','女','sex','性别',20,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'0'),('98','Integer','Integer','gen_java_type','Java类型\0\0',30,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1'),('99','Double','Double','gen_java_type','Java类型\0\0',40,'0','1','2013-10-28 08:00:00','1','2013-10-28 08:00:00',NULL,'1');
/*!40000 ALTER TABLE `sys_dict` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_log`
--

DROP TABLE IF EXISTS `sys_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_log` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `type` char(1) DEFAULT '1' COMMENT '日志类型',
  `title` varchar(255) DEFAULT '' COMMENT '日志标题',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `remote_addr` varchar(255) DEFAULT NULL COMMENT '操作IP地址',
  `user_agent` varchar(255) DEFAULT NULL COMMENT '用户代理',
  `request_uri` varchar(255) DEFAULT NULL COMMENT '请求URI',
  `method` varchar(5) DEFAULT NULL COMMENT '操作方式',
  `params` text COMMENT '操作提交的数据',
  `exception` text COMMENT '异常信息',
  PRIMARY KEY (`id`),
  KEY `sys_log_create_by` (`create_by`),
  KEY `sys_log_request_uri` (`request_uri`),
  KEY `sys_log_type` (`type`),
  KEY `sys_log_create_date` (`create_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日志表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_log`
--

LOCK TABLES `sys_log` WRITE;
/*!40000 ALTER TABLE `sys_log` DISABLE KEYS */;
INSERT INTO `sys_log` VALUES ('026487abdc5249c5a396bd3d71e3e3c2','1','内容管理-栏目设置-切换站点','1','2016-08-04 15:57:21','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/site/select','GET','',''),('03c439cdf9234b7288cd8b16239872f8','1','代码生成-代码生成-业务表配置','1','2016-08-04 16:55:45','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/gen/genTable','GET','',''),('05b2f16f55f742d5bc55e0fd133f66eb','1','系统设置-机构用户-用户管理','1','2016-08-04 16:53:29','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/index','GET','',''),('0740460b32654b41a38ac97e8fdcda83','1','代码生成-代码生成-业务表配置','1','2016-08-04 15:56:57','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/gen/genTable','GET','',''),('08547b92f0b94df0accc2fff7ab92113','1','内容管理-栏目设置-栏目管理-查看','1','2016-08-04 19:54:11','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/category/form','GET','id=2',''),('08cee9ffd17a40679c7d370b40575b1e','1','系统登录','791290e1344945a993748b7df9a2b628','2016-08-04 16:25:00','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a','GET','login=',''),('0be40114c7ce4500b5a186fc8b99c7b6','1','我的面板-个人信息-个人信息','1','2016-08-04 15:56:53','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','',''),('1006fe7695974b8c9fdad22396daa07f','1','我的面板-个人信息-个人信息','5cbc0c90dca846b88ab0b8a547006df2','2016-08-04 17:15:02','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','',''),('10e528730c1847af864445d70aa46531','1','我的面板-个人信息-个人信息','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:09','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','',''),('112e5018c898425e8fc8c76e3fa0d912','1','系统设置-机构用户-用户管理-查看','1','2016-08-04 19:42:05','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/list','GET','',''),('1169cb8525ea4b67a6a6addb32e80ea5','1','内容管理-栏目设置-栏目管理','1','2016-08-04 19:54:16','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/category/','GET','',''),('11c29d473d0e48d386f28f08ba0e5110','1','系统登录','791290e1344945a993748b7df9a2b628','2016-08-04 16:51:19','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a','GET','login=',''),('149ff1b72c9543e39c1a799a66331352','1','系统设置-系统设置-菜单管理-查看','1','2016-08-04 17:07:28','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/menu/form','GET','id=bac620c272f84f0988bde3c093c5e9f1',''),('163c711c0f9e425e969794c4b3b10296','1','我的面板-个人信息-个人信息','791290e1344945a993748b7df9a2b628','2016-08-04 19:37:28','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','',''),('17c6c918cb6f47e7aec26341b6859faf','1','系统登录','7cfec60bc9c947f284bff8a0247fb500','2016-08-04 19:39:40','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a','GET','login=',''),('187351b302144fc19d1120a0cd1e6e86','1','我的面板-个人信息-个人信息','7cfec60bc9c947f284bff8a0247fb500','2016-08-04 19:39:41','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','',''),('194bc3df32cd44d19dfb5c9493b85fed','1','系统登录','1','2016-08-04 17:09:27','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a','GET','login=',''),('1a8c46ea903d45b695c247db47a19c4d','1','我的面板-个人信息-我的签到','7cfec60bc9c947f284bff8a0247fb500','2016-08-04 19:39:43','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/qiandao/qiandao/list','GET','',''),('1b526e618f98451c96a9cedc091acbd4','1','系统设置-系统设置-菜单管理','1','2016-08-04 19:50:38','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/menu/','GET','',''),('1b9bdc4e875d4f478d79573eb0d2311f','1','内容管理-内容管理-评论管理-查看','1','2016-08-04 15:57:09','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/comment/','GET','status=2',''),('1c5e28da5a054bdcbd99b3caa2e7d776','1','系统设置-机构用户-用户管理','1','2016-08-04 19:50:32','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/index','GET','',''),('1c8e6f8eb17e4601a898eb15d9e1a87d','1','系统设置-机构用户-用户管理-修改','1','2016-08-04 16:52:22','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/checkLoginName','GET','oldLoginName=&loginName=gaiyuyan',''),('1e670cae9e2048fa92c80f187b05ffaf','1','系统设置-系统设置-角色管理-修改','1','2016-08-04 16:52:04','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/role/save','POST','dataScope=5&officeIds=&remarks=&office.id=2&oldName=教师一组&menuIds=1,27,28,29,30,cb2b4da8a7374dc7b530146b0bff5126,71,56,57,58,59,62,88,89,90,31,60,61,2,13,20,21,67,...&id=2338d11290ee4bf0b1e9b0c49786395e&useable=1&office.name=公司领导&name=教师一组&roleType=user&sysData=1&enname=teacher1&oldEnname=teacher1',''),('1e95480c00464c4b92e2541caf5ace22','1','数据审核-学员信息-审核','1','2016-08-04 15:57:01','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/resume/resume/list','GET','',''),('2057f28a43fb4ed6b2570dea5e96ea8b','1','我的面板-个人信息-个人信息','1','2016-08-04 16:51:33','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','',''),('21428c0a3d92485da87a63216c1d6300','1','内容管理-栏目设置-栏目管理','1','2016-08-04 19:53:57','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/category/','GET','',''),('23182142bd9242bfa75b42008c418f10','1','我的面板-个人信息-个人信息','1','2016-08-04 18:34:30','127.0.0.1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','',''),('24845266d5d54c2b8ef843073eb5960b','1','我的面板-个人信息-个人信息','1','2016-08-04 16:55:44','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','',''),('249b99f4a1234620937d9a199da4e472','1','系统设置-日志查询-日志查询','5cbc0c90dca846b88ab0b8a547006df2','2016-08-04 17:14:42','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/log','GET','',''),('2594f19f5a34470d828b8c781a4f1076','1','代码生成-代码生成-业务表配置','1','2016-08-04 17:11:16','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/gen/genTable','GET','',''),('25ae2dea587c4cf6ada48acb679dc93f','1','系统登录','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:09','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a','GET','login=',''),('266109d0b057413d8b71aaddef324fe8','1','系统设置-系统设置-角色管理','1','2016-08-04 16:55:58','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/role/','GET','repage=',''),('2680bb0eeefc4686bbe9f914601cb88e','1','我的面板-个人信息-个人信息','791290e1344945a993748b7df9a2b628','2016-08-04 16:51:19','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','',''),('26945b49b30c496391202c3e0261cbf2','1','系统设置-系统设置-角色管理-查看','1','2016-08-04 16:51:42','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/role/form','GET','id=2338d11290ee4bf0b1e9b0c49786395e',''),('2898e3888c2f459f9c29456627c0b16d','1','内容管理-栏目设置-站点设置','1','2016-08-04 15:57:20','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/site/','GET','',''),('291bdda446ba46e9b4465deb9017e93e','1','系统设置-系统设置-角色管理','1','2016-08-04 19:42:08','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/role/','GET','',''),('293b6a8a400a48c3b8974613c4efe4db','1','数据审核-学员信息-待审核','1','2016-08-04 17:09:45','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/resume/resume/list','GET','',''),('29b513dee26d4510b9b48a62b624b125','1','系统设置-机构用户-用户管理','1','2016-08-04 16:24:00','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/index','GET','',''),('2a5240de1b6842548becaf6a3c962633','1','内容管理-栏目设置-栏目管理-修改','1','2016-08-04 19:54:25','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/category/save','POST','module=article&keywords=&sort=20&isAudit=0&inList=1&customContentView=&inMenu=1&image=&office.id=4&id=10&customListView=&office.name=市场部&description=&parent.id=1&name=数据库&target=&allowComment=1&showModes=0&href=&viewConfig=&parent.name=顶级栏目',''),('2b4c57237d224d64a89df7c8d773aa74','1','系统设置-系统设置-角色管理-修改','1','2016-08-04 16:53:25','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/role/save','POST','dataScope=4&officeIds=&remarks=&office.id=bec64ac0838c400fb54d9ca823435a75&oldName=&id=&menuIds=1,27,28,29,30,cb2b4da8a7374dc7b530146b0bff5126,71,56,57,58,59,62,88,89,90,31,40,53,54,55,60,61,2,...&useable=1&office.name=二组&name=教师二组&roleType=assignment&oldEnname=&enname=teacher2&sysData=1',''),('2ca7d3ff910b4a7bb36301a993ebc3b0','1','系统设置-机构用户-用户管理-查看','1','2016-08-04 16:52:09','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/form','GET','',''),('2d4893e89f454318ae52aafb93eee0c4','1','系统设置-系统设置-角色管理-查看','1','2016-08-04 19:42:11','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/role/form','GET','id=2338d11290ee4bf0b1e9b0c49786395e',''),('2dfd7def2089427ab327c1bc4cb83931','1','系统设置-机构用户-用户管理-查看','1','2016-08-04 16:53:30','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/form','GET','',''),('2f68e6af76c4441eb657afbc84aae5f0','1','内容管理-栏目设置-栏目管理','1','2016-08-04 19:52:36','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/category/','GET','',''),('3166c1602b164eeeaf8097e69cf517fe','1','我的面板-个人信息-个人信息','7cfec60bc9c947f284bff8a0247fb500','2016-08-04 19:40:40','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','',''),('3188057188284ee3a506eecadd2708d4','1','系统设置-系统设置-角色管理-查看','1','2016-08-04 16:52:32','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/role/form','GET','',''),('3383e54587444cc2b0ee875f50c58fe3','1','内容管理-栏目设置-栏目管理-修改','1','2016-08-04 19:54:41','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/category/save','POST','module=article&keywords=&sort=20&isAudit=0&inList=1&customContentView=&inMenu=1&image=&office.id=3&id=6&customListView=&office.name=综合部&description=&parent.id=1&name=jquery&target=&allowComment=1&showModes=1&href=&viewConfig=&parent.name=顶级栏目',''),('3415790ffda2439192d89a371b733d00','1','我的面板-个人信息-个人信息','7cfec60bc9c947f284bff8a0247fb500','2016-08-04 19:40:35','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','',''),('34e8ddb9cf9d447e981395a01821100c','1','系统设置-机构用户-用户管理-查看','1','2016-08-04 16:24:47','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/list','GET','repage=',''),('34eb9ec0f8d7484b93401597eaf08f28','1','数据审核-学员信息-待审核','1','2016-08-04 17:13:36','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/resume/resume/list','GET','',''),('359d81ede8514e2bae00d49858f29b74','1','我的面板-个人信息-我的签到','1','2016-08-04 19:10:10','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/qiandao/qiandao/list','GET','',''),('3761b12437674313aaefc0aaa203d3cf','1','内容管理-栏目设置-栏目管理-修改','1','2016-08-04 19:54:07','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/category/delete','GET','id=7',''),('39a11da0f6994c56b7509a06dcb2dbbc','1','内容管理-栏目设置-栏目管理','1','2016-08-04 19:54:42','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/category/','GET','',''),('3b4ee68eb17e4bed82f4fd8744bd837b','1','系统设置-系统设置-角色管理','1','2016-08-04 16:53:25','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/role/','GET','repage=',''),('3b9bd956c4964b52be935ab422bba585','1','系统设置-机构用户-用户管理-修改','1','2016-08-04 16:24:29','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/checkLoginName','GET','oldLoginName=&loginName=1',''),('3c586f964dcd4162b75f0764a1d519d5','1','我的面板-个人信息-我的签到','1','2016-08-04 18:47:55','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/qiandao/qiandao/list','GET','',''),('3d08283b362340c9946719f0f72dbd0b','1','内容管理-栏目设置-栏目管理','1','2016-08-04 19:54:25','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/category/','GET','',''),('3e1998f638314ce2bad2a35f6ca207ed','1','系统设置-机构用户-用户管理-查看','791290e1344945a993748b7df9a2b628','2016-08-04 17:07:14','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/list','GET','',''),('3ebf03e38ad54d82a37306d339a8f1ad','1','内容管理-内容管理','1','2016-08-04 19:52:13','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/tree','GET','',''),('4084a7f6d7374ee2bf736541b4051e8a','1','系统设置-机构用户-机构管理-查看','1','2016-08-04 16:00:34','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/office/list','GET','id=&parentIds=',''),('40aaba7eb389486389d96df79d4e1e85','1','在线办公-通知通告-我的通告','5cbc0c90dca846b88ab0b8a547006df2','2016-08-04 17:15:03','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/oa/oaNotify/self','GET','',''),('40ed7738efd8475a9777725eec731296','1','在线办公-通知通告-我的通告','5cbc0c90dca846b88ab0b8a547006df2','2016-08-04 17:14:51','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/oa/oaNotify/self','GET','',''),('441403e01eac42b0b964d7b40ef16086','1','系统设置-日志查询-日志查询','791290e1344945a993748b7df9a2b628','2016-08-04 16:25:02','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/log','GET','',''),('4527f3d6a7024e9b8ade49f9e963d96b','1','在线办公-通知通告-通告管理','5cbc0c90dca846b88ab0b8a547006df2','2016-08-04 17:14:52','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/oa/oaNotify','GET','',''),('480864da45ba4ce6847ad04dcc891196','1','系统登录','1','2016-08-04 16:23:32','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a','GET','login=',''),('4af320733ad143f59ca4e188933b0cb1','1','代码生成-代码生成-业务表配置','1','2016-08-04 16:49:09','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/gen/genTable','GET','',''),('4c052637b46c4c908c15886975e74f97','1','在线办公-通知通告-我的通告','1','2016-08-04 15:57:02','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/oa/oaNotify/self','GET','',''),('4c12106246484bffa4cc9742cce1a87e','1','系统设置-系统设置-角色管理','1','2016-08-04 19:52:10','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/role/','GET','repage=',''),('4c84b3af23134b2781b20b78ca4f2e6e','1','系统设置-系统设置-菜单管理','1','2016-08-04 16:52:30','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/menu/','GET','',''),('4e41d42b3d22467abbe32edeaa9691ff','1','内容管理-栏目设置-栏目管理-修改','1','2016-08-04 19:53:09','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/category/delete','GET','id=18',''),('4ec11c1fee794531a708e242dfdce279','1','数据审核-学员信息-待审核','1','2016-08-04 19:10:14','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/resume/resume/list','GET','',''),('4f18cb0128ce4283b8d687faf3761be9','1','我的面板-个人信息-个人信息','791290e1344945a993748b7df9a2b628','2016-08-04 17:06:47','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','',''),('4f5cf04e0f0f4d7ca099b474e488f00b','1','系统登录','1','2016-08-04 16:49:05','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a','GET','login=',''),('5012811945da473599bf23fa11522195','1','系统登录','791290e1344945a993748b7df9a2b628','2016-08-04 19:37:26','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a;JSESSIONID=cb6498bbe37647d895755b2a09465623','GET','login=',''),('5109c7f23cf342c28c01176aa477284b','1','在线办公-通知通告-我的通告','7cfec60bc9c947f284bff8a0247fb500','2016-08-04 19:40:36','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/oa/oaNotify/self','GET','',''),('51240b7d64e94f04a5c835217b0a231f','1','内容管理-内容管理-内容发布','1','2016-08-04 15:57:02','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/','GET','',''),('5184a6c1c00e4be7a22ba121b2d2aab0','1','系统设置-机构用户-用户管理-修改','1','2016-08-04 16:24:47','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/checkLoginName','GET','oldLoginName=13552471077&loginName=13552471077',''),('51ca5cdc4446461b9ba4ae4852c18492','1','系统设置-系统设置-角色管理-修改','1','2016-08-04 16:55:58','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/role/save','POST','dataScope=4&officeIds=&remarks=&office.id=2&oldName=教师二组&id=1ccb42e0cce74d74924271fb00b72269&menuIds=1,27,28,29,30,cb2b4da8a7374dc7b530146b0bff5126,71,56,57,58,59,62,88,89,90,31,40,53,54,55,60,61,2,...&useable=1&office.name=公司领导&name=教师二组&roleType=user&oldEnname=teacher2&enname=teacher2&sysData=1',''),('51ee36b063564f578525814ce7ca21c0','1','系统设置-系统设置-角色管理','1','2016-08-04 16:51:39','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/role/','GET','',''),('5242b4597fb14a45ac1448e0124d641c','1','数据审核-学员信息-待审核','791290e1344945a993748b7df9a2b628','2016-08-04 19:37:29','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/resume/resume/list','GET','',''),('52ef5947108b4e88b605c353d7a7286e','1','系统登录','1','2016-08-04 19:10:03','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a','GET','login=',''),('5485395356bf426eac1d14f32605823e','1','系统设置-系统设置-菜单管理','1','2016-08-04 16:51:38','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/menu/','GET','',''),('574383ee75194952b4ee53341a66cc30','1','系统设置-机构用户-用户管理-查看','1','2016-08-04 16:53:45','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/list','GET','repage=',''),('584719a67c374cbaa0ea20591797d67a','1','内容管理-内容管理','1','2016-08-04 15:57:02','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/none','GET','',''),('5859d001774e4101ab719c2a8387ac07','1','在线办公-通知通告-我的通告','7cfec60bc9c947f284bff8a0247fb500','2016-08-04 19:40:02','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/oa/oaNotify/self','GET','',''),('5fe64210cb15476b95187ad84de9d45b','1','在线办公-通知通告-通告管理','7cfec60bc9c947f284bff8a0247fb500','2016-08-04 19:40:06','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/oa/oaNotify','GET','',''),('62d0d8201f0343aeb9423ed347ac1319','1','系统设置-机构用户-用户管理','1','2016-08-04 16:49:09','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/index','GET','',''),('649d65ad4c33469bad8ff793cf12cd9b','1','数据审核-学员信息-待审核','1','2016-08-04 17:13:34','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/resume/resume/list','GET','',''),('64cde722161844e59158a67a707721ce','1','系统设置-机构用户-用户管理-查看','1','2016-08-04 16:24:33','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/list','GET','',''),('64eebf6093334030bf6e7482a1264ad5','1','数据审核-学员信息-审核','791290e1344945a993748b7df9a2b628','2016-08-04 17:06:48','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/resume/resume/list','GET','',''),('65af268b71fe40af805d0405621368fe','1','系统设置-系统设置-角色管理','1','2016-08-04 16:55:51','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/role/','GET','',''),('670a051569334c17a3583c05a6f535eb','1','数据审核-学员信息-待审核','1','2016-08-04 17:11:18','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/resume/resume/list','GET','',''),('6787d8ccf64342209fd01b4f3fc38a19','1','系统设置-机构用户-用户管理-查看','1','2016-08-04 16:53:29','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/list','GET','',''),('68bf68c9751846a58429438afd96bf59','1','数据审核-学员信息-待审核','1','2016-08-04 18:34:48','127.0.0.1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/resume/resume/list','GET','',''),('695a367bf5a741c49eb1e0d5ee0f0cda','1','我的面板-个人信息-个人信息','7cfec60bc9c947f284bff8a0247fb500','2016-08-04 19:40:43','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','',''),('6baff4ef2fd14ad589c3ebe30f47ad8d','1','内容管理-栏目设置-栏目管理-查看','1','2016-08-04 19:54:19','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/category/form','GET','id=10',''),('6c90498b64a94a2ba066c22afd68b30a','1','内容管理-内容管理-内容发布-文章模型','1','2016-08-04 15:57:05','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/article/','GET','category.id=3',''),('6ceca95bba1243bebf52c37df8d71172','1','系统设置-机构用户-用户管理-查看','1','2016-08-04 15:57:01','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/list','GET','',''),('6de00c1d439042bda9157fa099a42332','1','系统设置-机构用户-用户管理-查看','1','2016-08-04 16:55:46','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/list','GET','',''),('6e59172a141144808d3e808789c7f26e','1','代码生成-代码生成-生成方案配置','1','2016-08-04 17:11:52','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/gen/genScheme','GET','',''),('70e03647860c481891dc811f58d99921','1','内容管理-统计分析-信息量统计','1','2016-08-04 15:57:16','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/stats/article','GET','',''),('719b616787524fbca83d7080fbb00708','1','系统设置-机构用户-用户管理','1','2016-08-04 16:55:46','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/index','GET','',''),('73adaaadd1a04cd795ca387f8e1d3bef','1','数据审核-学员信息-审核','791290e1344945a993748b7df9a2b628','2016-08-04 16:25:05','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/resume/resume/list','GET','',''),('764794a263f44a368b3743bd545a29f6','1','内容管理-栏目设置-栏目管理-修改','1','2016-08-04 19:53:57','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/category/save','POST','module=article&keywords=&sort=20&isAudit=0&inList=1&customContentView=&inMenu=1&image=&office.id=3&id=6&customListView=&office.name=综合部&description=&parent.id=1&name=MAVEN&target=&allowComment=1&showModes=1&href=&viewConfig=&parent.name=顶级栏目',''),('76717b2b456c40ab81dad1fa0f1b06f8','1','系统设置-机构用户-用户管理-查看','1','2016-08-04 17:07:22','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/list','GET','',''),('771e5fedc7874c50b301ed768a5611f6','1','内容管理-栏目设置-栏目管理','1','2016-08-04 19:53:14','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/category/','GET','',''),('779498e2aea54e0fa397ad5f5c28cb03','1','系统设置-机构用户-用户管理-修改','1','2016-08-04 16:24:47','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/save','POST','phone=&newPassword=&oldLoginName=13552471077&no=230302198401235312&roleIdList=b7c2266283a94cd08b8c0060a0f3d405&remarks=&loginFlag=1&photo=&office.id=8dc8c943e1bd4c468c34308e9ce6a7eb&company.name=中软瑞达&userType=&confirmNewPassword=&id=54b732a7a8dd44c2b6745b64cf9e3e77&_roleIdList=on&email=&office.name=一组&name=赵俊鹏&company.id=1&loginName=13552471077&mobile=13552471077',''),('77bd696328bd41bb94cf4f751514a163','1','我的面板-个人信息-个人信息','1','2016-08-04 19:42:02','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','',''),('782c406ad73943e4af970dc3bf5ddf6f','1','系统设置-机构用户-用户管理-查看','1','2016-08-04 16:24:38','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/form','GET','id=54b732a7a8dd44c2b6745b64cf9e3e77',''),('789c03acae6444c2ae0f6fb5d8e2af0f','1','我的面板-个人信息-个人信息','1','2016-08-04 17:07:20','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','',''),('7906ce7f7b30411aa8b3f33d58ef1cc2','1','内容管理-栏目设置-栏目管理','1','2016-08-04 19:52:21','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/category/','GET','',''),('7952c78ff8944903abbf2c0fa7a755eb','1','我的面板-个人信息-个人信息','1','2016-08-04 16:23:33','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','',''),('7a26592a06e4434a942a2d432d2e525e','1','内容管理-内容管理-内容发布-文章模型','1','2016-08-04 19:52:16','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/article/','GET','category.id=3',''),('7c49c801213e45a6ad82e10463be398a','1','系统设置-机构用户-用户管理-查看','1','2016-08-04 16:52:07','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/list','GET','',''),('7c7a93156b694477a00bcc688caaa214','1','系统设置-机构用户-用户管理-查看','1','2016-08-04 16:00:32','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/list','GET','',''),('7cdeb3c714554046befe9d23759587f5','1','系统设置-机构用户-用户管理-修改','1','2016-08-04 16:53:45','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/save','POST','phone=&no=gaiyuyan&oldLoginName=&newPassword=&roleIdList=1ccb42e0cce74d74924271fb00b72269&remarks=&loginFlag=1&photo=&office.id=bec64ac0838c400fb54d9ca823435a75&company.name=中软瑞达&userType=&id=&confirmNewPassword=&_roleIdList=on&email=&office.name=二组&company.id=1&name=gaiyuyan&loginName=gaiyuyan&mobile=',''),('7e877297b62f4384926405f9fc531e91','1','系统登录','27c5126e9403420983c6b692ffd1a29a','2016-08-04 17:06:34','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a','GET','login=',''),('7ef3fcc9a4b14979bb295c73018f0f67','1','数据审核-学员信息-审核','27c5126e9403420983c6b692ffd1a29a','2016-08-04 17:06:37','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/resume/resume/list','GET','',''),('7f339868a7094797be6082c9c21ab6e0','1','系统设置-系统设置-角色管理','1','2016-08-04 16:52:31','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/role/','GET','',''),('811f81415e8e436aae894cc87b5ef108','1','内容管理-栏目设置-栏目管理-修改','1','2016-08-04 19:52:35','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/category/delete','GET','id=25',''),('8127443b54e64e21ab897295114fe160','1','数据审核-学员信息-待审核','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:10','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/resume/resume/list','GET','',''),('82462b27d2c64fa1a53937c2fdf52d27','1','系统设置-机构用户-用户管理','1','2016-08-04 16:52:06','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/index','GET','',''),('84b166e3a6cd48b0a5e5052d3a61f458','1','系统设置-日志查询-日志查询','7cfec60bc9c947f284bff8a0247fb500','2016-08-04 19:40:42','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/log','GET','',''),('866e53a03a3a478f9459ae5956cb166a','1','我的面板-个人信息-个人信息','1','2016-08-04 19:10:06','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','',''),('879f911e79d54dfeb3864fff63845018','1','系统设置-系统设置-菜单管理-查看','1','2016-08-04 19:51:07','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/menu/form','GET','parent.id=e6a3e0370d5e4bedb450f20e48fcd2bd',''),('87a18a4898f74c819fc2f6f58f7747ca','1','内容管理-内容管理-内容发布','1','2016-08-04 19:52:12','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/','GET','',''),('88dba31ba4a9401c9c967327125889a3','1','系统设置-系统设置-菜单管理','1','2016-08-04 17:07:24','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/menu/','GET','',''),('8a102588a8a441c3b7a9abac5b615285','1','系统设置-机构用户-用户管理','1','2016-08-04 15:57:00','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/index','GET','',''),('8b214ec7851f4a77a67e98e6112113db','1','系统设置-机构用户-机构管理','1','2016-08-04 16:00:33','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/office/','GET','',''),('8e086ec8082d4d17b1f4de377e64216b','1','系统登录','27c5126e9403420983c6b692ffd1a29a','2016-08-04 16:53:50','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a','GET','login=',''),('8f0f4467204c4fa6a592e3a65061df8b','1','数据审核-学员信息-审核','1','2016-08-04 15:56:58','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/resume/resume/list','GET','',''),('93e825ea5b784898908182333694293a','1','系统设置-机构用户-用户管理-查看','1','2016-08-04 16:24:01','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/list','GET','',''),('95835d7e3ee44058985e5d3e61c1663c','1','系统设置-日志查询-日志查询','791290e1344945a993748b7df9a2b628','2016-08-04 16:51:27','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/log','GET','',''),('97c6c2fcc8e640ab8f849a5257db0b98','1','数据审核-学员信息-待审核','1','2016-08-04 17:09:30','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/resume/resume/list','GET','',''),('98775937cc044733b5864923f9a558a2','1','系统登录','1','2016-08-04 16:51:33','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a','GET','login=',''),('99004945eed04b618089020f6b9fc949','1','系统设置-机构用户-用户管理','1','2016-08-04 17:07:22','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/index','GET','',''),('994fa6e908604c68af5a4915ded28913','1','在线办公-通知通告-我的通告','7cfec60bc9c947f284bff8a0247fb500','2016-08-04 19:40:39','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/oa/oaNotify/self','GET','',''),('9a864393e51b42cda00eeccad00ccb65','1','内容管理-栏目设置-栏目管理','1','2016-08-04 19:53:09','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/category/','GET','',''),('9b758843ee9b44e5ae83611bf9d19fef','1','代码生成-代码生成-业务表配置','1','2016-08-04 17:13:34','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/gen/genTable','GET','',''),('9bdd7e56cb6d4d238d59e9f8b5193b1f','1','代码生成-代码生成-业务表配置','1','2016-08-04 15:57:31','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/gen/genTable','GET','',''),('9ec20a0fb51244349b3fa845301de3cd','1','在线办公-通知通告-我的通告','7cfec60bc9c947f284bff8a0247fb500','2016-08-04 19:40:44','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/oa/oaNotify/self','GET','',''),('a008d75365ea4f69b6a028120398f47e','1','系统设置-系统设置-菜单管理','1','2016-08-04 17:07:35','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/menu/','GET','',''),('a2a892c7d002479b9fa3c79f429e8225','1','我的面板-个人信息-修改密码','5cbc0c90dca846b88ab0b8a547006df2','2016-08-04 17:14:36','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/modifyPwd','GET','',''),('a2d14aab99a44962acb75b9e2aabbaef','1','代码生成-代码生成-业务表配置','1','2016-08-04 17:13:36','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/gen/genTable','GET','',''),('a64062168b634aeaae5b48e3fa5df4a5','1','系统设置-机构用户-用户管理-查看','1','2016-08-04 16:51:35','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/list','GET','',''),('a99ebca502704905858113fbbfd5c6d5','1','我的面板-个人信息-个人信息','1','2016-08-04 18:47:54','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','',''),('ad909d2dbd3f4e4cb9f917f5050647cf','1','我的面板-个人信息-个人信息','1','2016-08-04 17:09:30','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','',''),('aef1e6af4dab441488354a2ac109b34d','1','系统登录','1','2016-08-04 19:50:28','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a','GET','login=',''),('b12a0ee59e1545c19169f844ba3075ed','1','代码生成-代码生成-业务表配置','1','2016-08-04 15:56:59','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/gen/genTable','GET','',''),('b137e317146d43b49851d369eb1ae29e','1','在线办公-通知通告-我的通告','5cbc0c90dca846b88ab0b8a547006df2','2016-08-04 17:15:05','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/oa/oaNotify/self','GET','',''),('b16edd00dd4340efb0304ae9acf20e06','1','系统登录','1','2016-08-04 17:07:19','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a','GET','login=',''),('b181706996584ef3976aed390083fbda','1','系统登录','791290e1344945a993748b7df9a2b628','2016-08-04 17:06:47','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a','GET','login=',''),('b3423ceb171a45ba9b0b4083e917005b','1','系统设置-日志查询-日志查询','7cfec60bc9c947f284bff8a0247fb500','2016-08-04 19:40:45','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/log','GET','',''),('b37838889a79421e9df0d6012029f203','1','系统设置-系统设置-角色管理','1','2016-08-04 19:51:40','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/role/','GET','',''),('b444a3fc02964aa381ef7ad5d774ccc5','1','系统设置-机构用户-用户管理','1','2016-08-04 16:00:32','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/index','GET','',''),('b559935ef6724990aa0b7bbdeccc50be','1','我的面板-个人信息-我的签到','5cbc0c90dca846b88ab0b8a547006df2','2016-08-04 17:15:06','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/qiandao/qiandao/list','GET','',''),('b589d413fb7041c6853c2594e0ddc146','1','系统设置-系统设置-角色管理-查看','1','2016-08-04 19:51:43','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/role/form','GET','id=2338d11290ee4bf0b1e9b0c49786395e',''),('b6416a2207cc4ea2a4b09aaae1be46b7','1','系统设置-机构用户-用户管理','1','2016-08-04 16:51:35','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/index','GET','',''),('b76af1a569fb47e5882f6c9ba3d126a3','1','系统登录','5cbc0c90dca846b88ab0b8a547006df2','2016-08-04 17:14:33','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a','GET','login=',''),('b84566eb45294cf08062d9997e032712','1','系统登录','1','2016-08-04 18:34:28','127.0.0.1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a','GET','login=',''),('bb9878a20bf14bba9b8393289bf4cb46','1','内容管理-栏目设置-栏目管理','1','2016-08-04 15:57:18','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/category/','GET','',''),('bc8373b0904f47caa5dcbb48d2deaf57','1','数据审核-学员信息-待审核','1','2016-08-04 17:07:39','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/resume/resume/list','GET','',''),('be9b8d0fd2f247138933825b772ad1fb','1','系统设置-机构用户-用户管理-查看','1','2016-08-04 16:24:32','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/list','GET','office.id=8dc8c943e1bd4c468c34308e9ce6a7eb&office.name=一组',''),('c0cc9ab7ca454a70a916d4c6d0357611','1','系统设置-机构用户-用户管理','1','2016-08-04 19:42:04','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/index','GET','',''),('c1411cb5d5624478ada2c77317f71c18','1','内容管理-内容管理','1','2016-08-04 15:57:02','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/tree','GET','',''),('c2ed6ebbbe5f4bab9e67d9c054d3985a','1','数据审核-学员信息-审核','1','2016-08-04 15:56:55','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/resume/resume/list','GET','',''),('c3a347755a3844d2adf11bc2c7a48897','1','系统设置-机构用户-用户管理-查看','1','2016-08-04 16:24:04','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/form','GET','',''),('c3bd166899be474cbaab2c3c54d8b309','1','我的面板-个人信息-个人信息','5cbc0c90dca846b88ab0b8a547006df2','2016-08-04 17:14:33','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','',''),('c4826aad9c494fecb9a5605aef4876e3','1','内容管理-栏目设置-栏目管理-修改','1','2016-08-04 19:54:16','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/category/save','POST','module=article&keywords=&sort=10&isAudit=1&inList=1&customContentView=&inMenu=1&image=&office.id=3&id=2&customListView=&office.name=综合部&description=&parent.id=1&name=JAVA&target=&allowComment=0&showModes=0&href=&viewConfig=&parent.name=顶级栏目',''),('c5f44e151665491f8de10e958904b3c0','1','数据审核-学员信息-审核','1','2016-08-04 16:51:09','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/resume/resume/list','GET','',''),('c79e1964da144484a2d3eafd145df672','1','数据审核-学员信息-待审核','1','2016-08-04 20:05:33','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/resume/resume/list','GET','',''),('c7d2f09b85e24f63941eb383d684566b','1','系统设置-系统设置-菜单管理','1','2016-08-04 16:55:49','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/menu/','GET','',''),('c8f228b4e4ee4a718401064c903b48e8','1','系统设置-机构用户-用户管理-查看','1','2016-08-04 16:49:09','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/list','GET','',''),('d02435bf8e72445c826c266d674911b4','1','系统设置-系统设置-菜单管理-查看','1','2016-08-04 19:50:46','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/menu/form','GET','id=bac620c272f84f0988bde3c093c5e9f1',''),('d1251be7453b44e2bd12daad00dd7650','1','数据审核-学员信息-待审核','1','2016-08-04 17:07:40','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/resume/resume/list','GET','',''),('d29ebb5af1174846a19f880fc4eddf49','1','系统登录','1','2016-08-04 16:55:44','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a','GET','login=',''),('d2ffe518d4554a618de3de4219b63e85','1','系统登录','1','2016-08-04 19:42:01','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a','GET','login=',''),('d46ed354287e4036a926d9045493a14b','1','系统登录','1','2016-08-04 20:05:31','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/category/','GET','',''),('d4752a88705b4090be0a379223cf0fa4','1','我的面板-个人信息-个人信息','791290e1344945a993748b7df9a2b628','2016-08-04 16:25:01','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','',''),('d7e67ccb15c94c6c93a50682613d876e','1','数据审核-学员信息-审核','27c5126e9403420983c6b692ffd1a29a','2016-08-04 16:53:52','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/resume/resume/list','GET','',''),('da4b9f989f4b4311838eeb844f41059c','1','系统设置-系统设置-角色管理-修改','1','2016-08-04 19:52:10','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/role/save','POST','dataScope=5&officeIds=&remarks=&office.id=2&oldName=教师一组&menuIds=1,27,28,29,30,cb2b4da8a7374dc7b530146b0bff5126,71,56,57,58,59,62,88,89,90,31,40,41,42,43,44,45,46...&id=2338d11290ee4bf0b1e9b0c49786395e&useable=1&office.name=公司领导&name=教师一组&roleType=user&sysData=1&enname=teacher1&oldEnname=teacher1',''),('dbae06f0f89747e5a1d71ed90e18ec37','1','内容管理-栏目设置-站点设置-查看','1','2016-08-04 15:57:26','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/site/form','GET','id=2',''),('dcd7ca73411f49b698cbbcd21de1d594','1','系统设置-系统设置-角色管理-查看','1','2016-08-04 16:55:54','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/role/form','GET','id=1ccb42e0cce74d74924271fb00b72269',''),('de18a80519ce47b4bf0130189d61e978','1','内容管理-栏目设置-栏目管理-修改','1','2016-08-04 19:53:14','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/category/delete','GET','id=24',''),('de23842a413e45e0901763ad0798ab43','1','系统设置-系统设置-菜单管理-修改','1','2016-08-04 19:51:37','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/menu/save','POST','id=&icon=&sort=60&parent.id=e6a3e0370d5e4bedb450f20e48fcd2bd&name=我的学员&target=&permission=resume:student:view,resume:student:edit&remarks=&href=/resume/student/list&parent.name=学员信息&isShow=1',''),('de275644913344f7bce363d687c73675','1','系统设置-日志查询-日志查询','7cfec60bc9c947f284bff8a0247fb500','2016-08-04 19:39:47','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/log','GET','',''),('e3a8e6910af346288b3794051297f181','1','内容管理-栏目设置-站点设置','1','2016-08-04 15:57:22','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/site/','GET','',''),('e3be97a40c464f89944297cc29d73eec','1','我的面板-个人信息-个人信息','1','2016-08-04 16:49:06','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','',''),('e3cda1c0ffa149eea213f03e1be88a50','1','内容管理-栏目设置-栏目管理','1','2016-08-04 19:54:07','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/category/','GET','',''),('e457d42e948e4458906144c560e363a9','1','我的面板-个人信息-个人信息','1','2016-08-04 16:51:07','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','',''),('e5ae2bd676c14b149e9bd210112c39c5','1','我的面板-个人信息-个人信息','27c5126e9403420983c6b692ffd1a29a','2016-08-04 16:53:51','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','',''),('e5d2dde58e3b4f12b9bec0fe66396eb2','1','系统设置-系统设置-菜单管理-修改','1','2016-08-04 17:07:35','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/menu/save','POST','id=bac620c272f84f0988bde3c093c5e9f1&icon=&sort=30&parent.id=e6a3e0370d5e4bedb450f20e48fcd2bd&name=待审核&target=&permission=resume:resume:view,resume:resume:edit&remarks=&href=/resume/resume/list&parent.name=学员信息&isShow=1',''),('e716ca1e034e48d08b8331973e003a64','1','系统设置-系统设置-角色管理','1','2016-08-04 16:52:04','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/role/','GET','repage=',''),('e71b002138ef44198cb42a3ce904c707','1','系统设置-系统设置-菜单管理','1','2016-08-04 19:51:37','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/menu/','GET','',''),('e890648c698d4da8a32222daf627f5a2','1','数据审核-学员信息-待审核','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:07','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/resume/resume/list','GET','',''),('e8b5dcf4fa684550a9e3439046712ecd','1','数据审核-学员信息-审核','791290e1344945a993748b7df9a2b628','2016-08-04 16:51:20','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/resume/resume/list','GET','',''),('ea1bcad2603049a990c5115d0b0d4477','1','内容管理-栏目设置-栏目管理-查看','1','2016-08-04 19:53:45','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/category/form','GET','id=6',''),('ea3a9e12e68a4aada74ab6c60cba854e','1','内容管理-内容管理-公共留言-查看','1','2016-08-04 15:57:10','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/guestbook/','GET','status=2',''),('ea8634f18fc649b29365a1ae274a5093','1','我的面板-个人信息-个人信息','5cbc0c90dca846b88ab0b8a547006df2','2016-08-04 17:15:05','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','',''),('ebba252faead474cbbcf637417a1ffba','1','系统登录','1','2016-08-04 15:56:51','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a','GET','login=',''),('ecbef9c2b33b46d0b074b42977183ea4','1','我的面板-个人信息-个人信息','27c5126e9403420983c6b692ffd1a29a','2016-08-04 17:06:36','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','',''),('eeeda30c7859413590dda179ad4f6101','1','系统设置-机构用户-用户管理-查看','1','2016-08-04 19:50:33','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/list','GET','',''),('f2223cfb9801430eb1f63289658a0b89','1','系统设置-机构用户-用户管理-修改','1','2016-08-04 16:53:40','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/checkLoginName','GET','oldLoginName=&loginName=gaiyuyan',''),('f5a96a2b00824bc4b0b4c8682ab61165','1','内容管理-栏目设置-栏目管理-查看','1','2016-08-04 19:54:35','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/category/form','GET','id=6',''),('f8fa6497126d4f0fa3fe93ec36fcd8d1','1','系统设置-机构用户-用户管理','1','2016-08-04 16:24:33','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/index','GET','',''),('fa1a909afed941efbf6c742c637ba6f0','1','系统设置-日志查询-日志查询','7cfec60bc9c947f284bff8a0247fb500','2016-08-04 19:40:37','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/log','GET','',''),('fa7b6ed19bde4d7d86fd96086eb5ca0b','1','内容管理-栏目设置-栏目管理','1','2016-08-04 20:05:31','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/category/','GET','',''),('fb8efb5392684a73a8deab1f6795861e','1','内容管理-统计分析-信息量统计','791290e1344945a993748b7df9a2b628','2016-08-04 17:07:13','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/stats/article','GET','',''),('fe561b1c3e5043e0ac5dd58edb616cab','1','代码生成-代码生成-业务表配置','1','2016-08-04 17:11:37','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/gen/genTable','GET','',''),('fe76962275904a1e949f8907f5456257','1','内容管理-内容管理','1','2016-08-04 19:52:13','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/cms/none','GET','',''),('fed33693536948b2ad828d15ba275f78','1','系统登录','1','2016-08-04 18:47:52','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a','GET','login=',''),('feecf76c97a14edd800168dbed0bc0d8','1','系统设置-机构用户-用户管理','791290e1344945a993748b7df9a2b628','2016-08-04 17:07:14','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/index','GET','',''),('ff88f6822e2c414d93722224ac8554b7','1','我的面板-个人信息-个人信息','1','2016-08-04 19:50:31','0:0:0:0:0:0:0:1','Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.04','/a/sys/user/info','GET','','');
/*!40000 ALTER TABLE `sys_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_mdict`
--

DROP TABLE IF EXISTS `sys_mdict`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_mdict` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_mdict_parent_id` (`parent_id`),
  KEY `sys_mdict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='多级字典表';
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
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `href` varchar(2000) DEFAULT NULL COMMENT '链接',
  `target` varchar(20) DEFAULT NULL COMMENT '目标',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `is_show` char(1) NOT NULL COMMENT '是否在菜单中显示',
  `permission` varchar(200) DEFAULT NULL COMMENT '权限标识',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_menu_parent_id` (`parent_id`),
  KEY `sys_menu_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES ('0b2ebd4d639e4c2b83c2dd0764522f24','ba8092291b40482db8fe7fc006ea3d76','0,1,79,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,','编辑',60,'','','','0','test:testData:edit','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('0ca004d6b1bf4bcab9670a5060d82a55','3c92c17886944d0687e73e286cada573','0,1,79,3c92c17886944d0687e73e286cada573,','树结构',90,'/test/testTree','','','1','','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('1','0','0,','功能菜单',0,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('10','3','0,1,2,3,','字典管理',60,'/sys/dict/',NULL,'th-list','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('11','10','0,1,2,3,10,','查看',30,NULL,NULL,NULL,'0','sys:dict:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('12','10','0,1,2,3,10,','修改',40,NULL,NULL,NULL,'0','sys:dict:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('13','2','0,1,2,','机构用户',970,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('14','13','0,1,2,13,','区域管理',50,'/sys/area/',NULL,'th','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('15','14','0,1,2,13,14,','查看',30,NULL,NULL,NULL,'0','sys:area:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('16','14','0,1,2,13,14,','修改',40,NULL,NULL,NULL,'0','sys:area:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('17','13','0,1,2,13,','机构管理',40,'/sys/office/',NULL,'th-large','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('18','17','0,1,2,13,17,','查看',30,NULL,NULL,NULL,'0','sys:office:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('19','17','0,1,2,13,17,','修改',40,NULL,NULL,NULL,'0','sys:office:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('2','1','0,1,','系统设置',900,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('20','13','0,1,2,13,','用户管理',30,'/sys/user/index',NULL,'user','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('21','20','0,1,2,13,20,','查看',30,NULL,NULL,NULL,'0','sys:user:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('22','20','0,1,2,13,20,','修改',40,NULL,NULL,NULL,'0','sys:user:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('23','2','0,1,2,','关于帮助',990,NULL,NULL,NULL,'0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('24','23','0,1,2,23','官方首页',30,'http://jeesite.com','_blank',NULL,'0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('25','23','0,1,2,23','项目支持',50,'http://jeesite.com/donation.html','_blank',NULL,'0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('26','23','0,1,2,23','论坛交流',80,'http://bbs.jeesite.com','_blank',NULL,'0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'1'),('27','1','0,1,','我的面板',100,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('28','27','0,1,27,','个人信息',30,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('29','28','0,1,27,28,','个人信息',30,'/sys/user/info',NULL,'user','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','2','0,1,2,','系统设置',980,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('30','28','0,1,27,28,','修改密码',40,'/sys/user/modifyPwd',NULL,'lock','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('31','1','0,1,','内容管理',500,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('32','31','0,1,31,','栏目设置',990,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('33','32','0,1,31,32','栏目管理',30,'/cms/category/',NULL,'align-justify','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('34','33','0,1,31,32,33,','查看',30,NULL,NULL,NULL,'0','cms:category:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('35','33','0,1,31,32,33,','修改',40,NULL,NULL,NULL,'0','cms:category:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('36','32','0,1,31,32','站点设置',40,'/cms/site/',NULL,'certificate','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('37','36','0,1,31,32,36,','查看',30,NULL,NULL,NULL,'0','cms:site:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('38','36','0,1,31,32,36,','修改',40,NULL,NULL,NULL,'0','cms:site:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('39','32','0,1,31,32','切换站点',50,'/cms/site/select',NULL,'retweet','1','cms:site:select','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3c92c17886944d0687e73e286cada573','79','0,1,79,','生成示例',120,'','','','1','','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('4','3','0,1,2,3,','菜单管理',30,'/sys/menu/',NULL,'list-alt','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('40','31','0,1,31,','内容管理',500,NULL,NULL,NULL,'1','cms:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('41','40','0,1,31,40,','内容发布',30,'/cms/',NULL,'briefcase','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('42','41','0,1,31,40,41,','文章模型',40,'/cms/article/',NULL,'file','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('43','42','0,1,31,40,41,42,','查看',30,NULL,NULL,NULL,'0','cms:article:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('44','42','0,1,31,40,41,42,','修改',40,NULL,NULL,NULL,'0','cms:article:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('45','42','0,1,31,40,41,42,','审核',50,NULL,NULL,NULL,'0','cms:article:audit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('46','41','0,1,31,40,41,','链接模型',60,'/cms/link/',NULL,'random','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('47','46','0,1,31,40,41,46,','查看',30,NULL,NULL,NULL,'0','cms:link:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('48','46','0,1,31,40,41,46,','修改',40,NULL,NULL,NULL,'0','cms:link:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4855cf3b25c244fb8500a380db189d97','b1f6d1b86ba24365bae7fd86c5082317','0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,','查看',30,'','','','0','test:testDataMain:view','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('49','46','0,1,31,40,41,46,','审核',50,NULL,NULL,NULL,'0','cms:link:audit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4f33f8a81d6c4746aabf595eac69b96c','e6a3e0370d5e4bedb450f20e48fcd2bd','0,1,6d0ec2aa7cc94378ba3fb4463306463c,e6a3e0370d5e4bedb450f20e48fcd2bd,','我的学员',60,'/resume/student/list','','','1','resume:student:view,resume:student:edit','1','2016-08-04 19:51:36','1','2016-08-04 19:51:36','','0'),('5','4','0,1,2,3,4,','查看',30,NULL,NULL,NULL,'0','sys:menu:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('50','40','0,1,31,40,','评论管理',40,'/cms/comment/?status=2',NULL,'comment','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('51','50','0,1,31,40,50,','查看',30,NULL,NULL,NULL,'0','cms:comment:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('52','50','0,1,31,40,50,','审核',40,NULL,NULL,NULL,'0','cms:comment:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('53','40','0,1,31,40,','公共留言',80,'/cms/guestbook/?status=2',NULL,'glass','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('54','53','0,1,31,40,53,','查看',30,NULL,NULL,NULL,'0','cms:guestbook:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('55','53','0,1,31,40,53,','审核',40,NULL,NULL,NULL,'0','cms:guestbook:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('56','71','0,1,27,71,','文件管理',90,'/../static/ckfinder/ckfinder.html',NULL,'folder-open','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('57','56','0,1,27,40,56,','查看',30,NULL,NULL,NULL,'0','cms:ckfinder:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('58','56','0,1,27,40,56,','上传',40,NULL,NULL,NULL,'0','cms:ckfinder:upload','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('59','56','0,1,27,40,56,','修改',50,NULL,NULL,NULL,'0','cms:ckfinder:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6','4','0,1,2,3,4,','修改',40,NULL,NULL,NULL,'0','sys:menu:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('60','31','0,1,31,','统计分析',600,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('61','60','0,1,31,60,','信息量统计',30,'/cms/stats/article',NULL,'tasks','1','cms:stats:article','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('62','1','0,1,','在线办公',200,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('63','62','0,1,62,','个人办公',30,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('64','63','0,1,62,63,','请假办理',300,'/oa/leave',NULL,'leaf','0',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('65','64','0,1,62,63,64,','查看',30,NULL,NULL,NULL,'0','oa:leave:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('66','64','0,1,62,63,64,','修改',40,NULL,NULL,NULL,'0','oa:leave:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('67','2','0,1,2,','日志查询',985,NULL,NULL,NULL,'1',NULL,'1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('68','67','0,1,2,67,','日志查询',30,'/sys/log',NULL,'pencil','1','sys:log:view','1','2013-06-03 08:00:00','1','2013-06-03 08:00:00',NULL,'0'),('69','62','0,1,62,','流程管理',300,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('6d0ec2aa7cc94378ba3fb4463306463c','1','0,1,','数据审核',5030,'','','','1','','1','2016-08-02 11:02:46','1','2016-08-02 11:02:46','','0'),('7','3','0,1,2,3,','角色管理',50,'/sys/role/',NULL,'lock','1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('70','69','0,1,62,69,','流程管理',50,'/act/process',NULL,'road','1','act:process:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('71','27','0,1,27,','文件管理',90,NULL,NULL,NULL,'1',NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('72','69','0,1,62,69,','模型管理',100,'/act/model',NULL,'road','1','act:model:edit','1','2013-09-20 08:00:00','1','2013-09-20 08:00:00',NULL,'0'),('73','63','0,1,62,63,','我的任务',50,'/act/task/todo/',NULL,'tasks','1',NULL,'1','2013-09-24 08:00:00','1','2013-09-24 08:00:00',NULL,'0'),('74','63','0,1,62,63,','审批测试',100,'/oa/testAudit',NULL,NULL,'1','oa:testAudit:view,oa:testAudit:edit','1','2013-09-24 08:00:00','1','2013-09-24 08:00:00',NULL,'0'),('75','1','0,1,','在线演示',3000,NULL,NULL,NULL,'1',NULL,'1','2013-10-08 08:00:00','1','2013-10-08 08:00:00',NULL,'1'),('79','1','0,1,','代码生成',5000,NULL,NULL,NULL,'1',NULL,'1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'0'),('8','7','0,1,2,3,7,','查看',30,NULL,NULL,NULL,'0','sys:role:view','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('80','79','0,1,79,','代码生成',50,NULL,NULL,NULL,'1',NULL,'1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'0'),('81','80','0,1,79,80,','生成方案配置',30,'/gen/genScheme',NULL,NULL,'1','gen:genScheme:view,gen:genScheme:edit','1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'0'),('82','80','0,1,79,80,','业务表配置',20,'/gen/genTable',NULL,NULL,'1','gen:genTable:view,gen:genTable:edit,gen:genTableColumn:view,gen:genTableColumn:edit','1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'0'),('83','80','0,1,79,80,','代码模板管理',90,'/gen/genTemplate',NULL,NULL,'1','gen:genTemplate:view,gen:genTemplate:edit','1','2013-10-16 08:00:00','1','2013-10-16 08:00:00',NULL,'1'),('84','67','0,1,2,67,','连接池监视',40,'/../druid',NULL,NULL,'1',NULL,'1','2013-10-18 08:00:00','1','2013-10-18 08:00:00',NULL,'0'),('85','76','0,1,75,76,','行政区域',80,'/../static/map/map-city.html',NULL,NULL,'1',NULL,'1','2013-10-22 08:00:00','1','2013-10-22 08:00:00',NULL,'0'),('86','75','0,1,75,','组件演示',50,NULL,NULL,NULL,'1',NULL,'1','2013-10-22 08:00:00','1','2013-10-22 08:00:00',NULL,'1'),('87','86','0,1,75,86,','组件演示',30,'/test/test/form',NULL,NULL,'1','test:test:view,test:test:edit','1','2013-10-22 08:00:00','1','2013-10-22 08:00:00',NULL,'1'),('88','62','0,1,62,','通知通告',20,'','','','1','','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('89','88','0,1,62,88,','我的通告',30,'/oa/oaNotify/self','','','1','','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('9','7','0,1,2,3,7,','修改',40,NULL,NULL,NULL,'0','sys:role:edit','1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('90','88','0,1,62,88,','通告管理',50,'/oa/oaNotify','','','1','oa:oaNotify:view,oa:oaNotify:edit','1','2013-11-08 08:00:00','1','2013-11-08 08:00:00',NULL,'0'),('92f7ce9fbef642709186f0cc617cbb2c','27','0,1,27,','我的签到',120,'/qiandao/qiandao/list','','','1','qiandao:qiandao:view','1','2016-08-01 18:09:56','1','2016-08-01 18:09:56','','1'),('afab2db430e2457f9cf3a11feaa8b869','0ca004d6b1bf4bcab9670a5060d82a55','0,1,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,','编辑',60,'','','','0','test:testTree:edit','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('b1f6d1b86ba24365bae7fd86c5082317','3c92c17886944d0687e73e286cada573','0,1,79,3c92c17886944d0687e73e286cada573,','主子表',60,'/test/testDataMain','','','1','','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('ba8092291b40482db8fe7fc006ea3d76','3c92c17886944d0687e73e286cada573','0,1,79,3c92c17886944d0687e73e286cada573,','单表',30,'/test/testData','','','1','','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('bac620c272f84f0988bde3c093c5e9f1','e6a3e0370d5e4bedb450f20e48fcd2bd','0,1,6d0ec2aa7cc94378ba3fb4463306463c,e6a3e0370d5e4bedb450f20e48fcd2bd,','待审核',30,'/resume/resume/list','','','1','resume:resume:view,resume:resume:edit','1','2016-08-02 11:04:06','1','2016-08-04 17:07:35','','0'),('c2e4d9082a0b4386884a0b203afe2c5c','0ca004d6b1bf4bcab9670a5060d82a55','0,1,79,3c92c17886944d0687e73e286cada573,0ca004d6b1bf4bcab9670a5060d82a55,','查看',30,'','','','0','test:testTree:view','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('cb2b4da8a7374dc7b530146b0bff5126','28','0,1,27,28,','我的签到',70,'/qiandao/qiandao/list','','asterisk','1','qiandao:qiandao:view','1','2016-08-01 18:10:51','1','2016-08-01 19:04:16','','0'),('d15ec45a4c5449c3bbd7a61d5f9dd1d2','b1f6d1b86ba24365bae7fd86c5082317','0,1,79,3c92c17886944d0687e73e286cada573,b1f6d1b86ba24365bae7fd86c5082317,','编辑',60,'','','','0','test:testDataMain:edit','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('df7ce823c5b24ff9bada43d992f373e2','ba8092291b40482db8fe7fc006ea3d76','0,1,79,3c92c17886944d0687e73e286cada573,ba8092291b40482db8fe7fc006ea3d76,','查看',30,'','','','0','test:testData:view','1','2013-08-12 13:10:05','1','2013-08-12 13:10:05','','0'),('e6a3e0370d5e4bedb450f20e48fcd2bd','6d0ec2aa7cc94378ba3fb4463306463c','0,1,6d0ec2aa7cc94378ba3fb4463306463c,','学员信息',30,'','','','1','','1','2016-08-02 11:03:25','1','2016-08-02 11:04:18','','0');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_office`
--

DROP TABLE IF EXISTS `sys_office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_office` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `area_id` varchar(64) NOT NULL COMMENT '归属区域',
  `code` varchar(100) DEFAULT NULL COMMENT '区域编码',
  `type` char(1) NOT NULL COMMENT '机构类型',
  `grade` char(1) NOT NULL COMMENT '机构等级',
  `address` varchar(255) DEFAULT NULL COMMENT '联系地址',
  `zip_code` varchar(100) DEFAULT NULL COMMENT '邮政编码',
  `master` varchar(100) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(200) DEFAULT NULL COMMENT '电话',
  `fax` varchar(200) DEFAULT NULL COMMENT '传真',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `USEABLE` varchar(64) DEFAULT NULL COMMENT '是否启用',
  `PRIMARY_PERSON` varchar(64) DEFAULT NULL COMMENT '主负责人',
  `DEPUTY_PERSON` varchar(64) DEFAULT NULL COMMENT '副负责人',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_office_parent_id` (`parent_id`),
  KEY `sys_office_del_flag` (`del_flag`),
  KEY `sys_office_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机构表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_office`
--

LOCK TABLES `sys_office` WRITE;
/*!40000 ALTER TABLE `sys_office` DISABLE KEYS */;
INSERT INTO `sys_office` VALUES ('1','0','0,','中软瑞达',10,'2','100000','1','1','','','','','','','1','','','1','2013-05-27 08:00:00','1','2016-08-01 19:24:54','','0'),('10185106bec24a37afa3a18e5bf438de','ff0a982b3e954d61a5de9033402f5cf0','0,1,ff0a982b3e954d61a5de9033402f5cf0,','十组',30,'2','100000006010','2','2','','','','','','','1','','','1','2016-08-04 15:30:25','1','2016-08-04 15:30:25','','0'),('16923df7ef9342869cbb6dbad62fffa4','ff0a982b3e954d61a5de9033402f5cf0','0,1,ff0a982b3e954d61a5de9033402f5cf0,','十八组',30,'2','100000006018','2','2','','','','','','','1','','','1','2016-08-04 15:31:19','1','2016-08-04 15:31:19','','0'),('1cbb11c515c44eb38625ff5a2544ab41','ff0a982b3e954d61a5de9033402f5cf0','0,1,ff0a982b3e954d61a5de9033402f5cf0,','四组',30,'2','100000006004','2','2','','','','','','','1','','','1','2016-08-04 15:29:48','1','2016-08-04 15:29:48','','0'),('2','1','0,1,','公司领导',10,'2','100001','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('3','1','0,1,','综合部',20,'2','100002','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('4','1','0,1,','市场部',30,'2','100003','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('487e3e9429b64f1ebfd3b68c1d48cf12','ff0a982b3e954d61a5de9033402f5cf0','0,1,ff0a982b3e954d61a5de9033402f5cf0,','八组',30,'2','100000006008','2','2','','','','','','','1','','','1','2016-08-04 15:30:11','1','2016-08-04 15:30:11','','0'),('5','1','0,1,','技术部',40,'2','100004','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('550f28acf28b455cab0a04cf5dcab518','ff0a982b3e954d61a5de9033402f5cf0','0,1,ff0a982b3e954d61a5de9033402f5cf0,','十二组',30,'2','100000006012','2','2','','','','','','','1','','','1','2016-08-04 15:30:40','1','2016-08-04 15:30:40','','0'),('6','1','0,1,','研发部',50,'2','100005','2','1',NULL,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL,'1','2013-05-27 08:00:00','1','2013-05-27 08:00:00',NULL,'0'),('676c4605aa794a69b2bf6fe83c31bc50','ff0a982b3e954d61a5de9033402f5cf0','0,1,ff0a982b3e954d61a5de9033402f5cf0,','十六组',30,'2','100000006016','2','2','','','','','','','1','','','1','2016-08-04 15:31:07','1','2016-08-04 15:31:07','','0'),('6ecb5f5678014671bf0abb2a311273a7','ff0a982b3e954d61a5de9033402f5cf0','0,1,ff0a982b3e954d61a5de9033402f5cf0,','五组',30,'2','100000006005','2','2','','','','','','','1','','','1','2016-08-04 15:29:54','1','2016-08-04 15:29:54','','0'),('7f2113c936804b5a9523127668259063','ff0a982b3e954d61a5de9033402f5cf0','0,1,ff0a982b3e954d61a5de9033402f5cf0,','十五组',30,'2','100000006015','2','2','','','','','','','1','','','1','2016-08-04 15:30:58','1','2016-08-04 15:30:58','','0'),('7fc0e8794d1f4e28b2f50ef7df0394cc','ff0a982b3e954d61a5de9033402f5cf0','0,1,ff0a982b3e954d61a5de9033402f5cf0,','十七组',30,'2','100000006017','2','2','','','','','','','1','','','1','2016-08-04 15:31:14','1','2016-08-04 15:31:14','','0'),('8dc8c943e1bd4c468c34308e9ce6a7eb','ff0a982b3e954d61a5de9033402f5cf0','0,1,ff0a982b3e954d61a5de9033402f5cf0,','一组',30,'2','100000006001','2','2','','','','','','','1','','','1','2016-08-04 15:29:16','1','2016-08-04 15:29:16','','0'),('9d68c06ad88b462c962e3ed549dbc875','ff0a982b3e954d61a5de9033402f5cf0','0,1,ff0a982b3e954d61a5de9033402f5cf0,','十九组',30,'2','100000006019','2','2','','','','','','','1','','','1','2016-08-04 15:31:24','1','2016-08-04 15:31:24','','0'),('a8f981852b6b4d93b8e577d48b719e8d','ff0a982b3e954d61a5de9033402f5cf0','0,1,ff0a982b3e954d61a5de9033402f5cf0,','七组',30,'2','100000006007','2','2','','','','','','','1','','','1','2016-08-04 15:30:07','1','2016-08-04 15:30:07','','0'),('ab533e49d6d14ce8bda6b4df30d907da','ff0a982b3e954d61a5de9033402f5cf0','0,1,ff0a982b3e954d61a5de9033402f5cf0,','六组',30,'2','100000006006','2','2','','','','','','','1','','','1','2016-08-04 15:30:00','1','2016-08-04 15:30:00','','0'),('bc2d5fa9984842e1ab003d72342f67a1','ff0a982b3e954d61a5de9033402f5cf0','0,1,ff0a982b3e954d61a5de9033402f5cf0,','十一组',30,'2','100000006011','2','2','','','','','','','1','','','1','2016-08-04 15:30:35','1','2016-08-04 15:30:35','','0'),('bec64ac0838c400fb54d9ca823435a75','ff0a982b3e954d61a5de9033402f5cf0','0,1,ff0a982b3e954d61a5de9033402f5cf0,','二组',30,'2','100000006002','2','2','','','','','','','1','','','1','2016-08-04 15:29:27','1','2016-08-04 15:29:27','','0'),('c3963ac88d77402ab5f4918683beceba','ff0a982b3e954d61a5de9033402f5cf0','0,1,ff0a982b3e954d61a5de9033402f5cf0,','二十组',30,'2','100000006020','2','2','','','','','','','1','','','1','2016-08-04 15:31:31','1','2016-08-04 15:31:31','','0'),('c39f0c50071b43db9157b110722db272','ff0a982b3e954d61a5de9033402f5cf0','0,1,ff0a982b3e954d61a5de9033402f5cf0,','十四组',30,'2','100000006014','2','2','','','','','','','1','','','1','2016-08-04 15:30:52','1','2016-08-04 15:30:52','','0'),('d9e168c2e7ec4711acee09e4732fd6b3','ff0a982b3e954d61a5de9033402f5cf0','0,1,ff0a982b3e954d61a5de9033402f5cf0,','三组',30,'2','100000006003','2','2','','','','','','','1','','','1','2016-08-04 15:29:41','1','2016-08-04 15:29:41','','0'),('deab837858c9485ba0c8a7ecadcdfd0c','ff0a982b3e954d61a5de9033402f5cf0','0,1,ff0a982b3e954d61a5de9033402f5cf0,','九组',30,'2','100000006009','2','2','','','','','','','1','','','1','2016-08-04 15:30:17','1','2016-08-04 15:30:17','','0'),('f6cc7046a9284b2c83c00d91fd9aea44','ff0a982b3e954d61a5de9033402f5cf0','0,1,ff0a982b3e954d61a5de9033402f5cf0,','十三组',30,'2','100000006013','2','2','','','','','','','1','','','1','2016-08-04 15:30:46','1','2016-08-04 15:30:46','','0'),('ff0a982b3e954d61a5de9033402f5cf0','1','0,1,','教育部',30,'2','100000006','2','1','','','','','','','1','','','1','2016-08-01 19:27:34','1','2016-08-04 11:03:51','','0');
/*!40000 ALTER TABLE `sys_office` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `office_id` varchar(64) DEFAULT NULL COMMENT '归属机构',
  `name` varchar(100) NOT NULL COMMENT '角色名称',
  `enname` varchar(255) DEFAULT NULL COMMENT '英文名称',
  `role_type` varchar(255) DEFAULT NULL COMMENT '角色类型',
  `data_scope` char(1) DEFAULT NULL COMMENT '数据范围',
  `is_sys` varchar(64) DEFAULT NULL COMMENT '是否系统数据',
  `useable` varchar(64) DEFAULT NULL COMMENT '是否可用',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_role_del_flag` (`del_flag`),
  KEY `sys_role_enname` (`enname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES ('1ccb42e0cce74d74924271fb00b72269','2','教师二组','teacher2','user','4','1','1','1','2016-08-04 16:53:25','1','2016-08-04 16:55:58','','0'),('2','2','公司管理员','administrator','security-role','2','1','1','1','2013-05-27 08:00:00','1','2016-08-02 11:04:56','','0'),('2338d11290ee4bf0b1e9b0c49786395e','2','教师一组','teacher1','user','5','1','1','1','2016-08-04 15:35:11','1','2016-08-04 19:52:10','','0'),('b7c2266283a94cd08b8c0060a0f3d405','ff0a982b3e954d61a5de9033402f5cf0','学员','xueyuan','user','8','1','1','1','2016-08-01 19:28:24','1','2016-08-01 19:40:27','','0');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_menu` (
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  `menu_id` varchar(64) NOT NULL COMMENT '菜单编号',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-菜单';
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
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  `office_id` varchar(64) NOT NULL COMMENT '机构编号',
  PRIMARY KEY (`role_id`,`office_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-机构';
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
  `id` varchar(64) NOT NULL COMMENT '编号',
  `company_id` varchar(64) NOT NULL COMMENT '归属公司',
  `office_id` varchar(64) NOT NULL COMMENT '归属部门',
  `login_name` varchar(100) NOT NULL COMMENT '登录名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `no` varchar(100) DEFAULT NULL COMMENT '工号',
  `name` varchar(100) NOT NULL COMMENT '姓名',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(200) DEFAULT NULL COMMENT '电话',
  `mobile` varchar(200) DEFAULT NULL COMMENT '手机',
  `open_id` varchar(64) DEFAULT NULL,
  `account_no` varchar(20) DEFAULT NULL,
  `user_type` char(1) DEFAULT NULL COMMENT '用户类型',
  `photo` varchar(1000) DEFAULT NULL COMMENT '用户头像',
  `login_ip` varchar(100) DEFAULT NULL COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `login_flag` varchar(64) DEFAULT NULL COMMENT '是否可登录',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_user_office_id` (`office_id`),
  KEY `sys_user_login_name` (`login_name`),
  KEY `sys_user_company_id` (`company_id`),
  KEY `sys_user_update_date` (`update_date`),
  KEY `sys_user_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES ('1','1','2','admin','02a3f0772fcca9f415adc990734b45c6f059c7d33ee28362c4852032','0001','系统管理员','thinkgem@163.com','8675','8675',NULL,NULL,'','','0:0:0:0:0:0:0:1','2016-08-04 20:05:31','1','1','2013-05-27 08:00:00','1','2016-08-01 19:36:45','最高管理员','0'),('27c5126e9403420983c6b692ffd1a29a','1','bec64ac0838c400fb54d9ca823435a75','gaiyuyan','5a54b6de1d8913e0845c51b0d7a39ad5f4581b5e3ca9c4baea86d714','gaiyuyan','gaiyuyan','','','',NULL,NULL,'','','0:0:0:0:0:0:0:1','2016-08-04 17:06:34','1','1','2016-08-04 16:53:45','1','2016-08-04 16:53:45','','0'),('5cbc0c90dca846b88ab0b8a547006df2','1','ff0a982b3e954d61a5de9033402f5cf0','18801029695','cc4a8b8464f8021c1a922a05a9d7ec469212bdb94073b46f2e2ee8a6','230302198402175312','赵俊飞','',NULL,'18801029695',NULL,'2016080410000013',NULL,NULL,'0:0:0:0:0:0:0:1','2016-08-04 17:14:33','1','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:15','791290e1344945a993748b7df9a2b628','2016-08-04 17:14:16',NULL,'0'),('72a0d38fa2654dea9423391acc251a02','1','ff0a982b3e954d61a5de9033402f5cf0','13552471077','2badb884a9e583ca75a57d3f1131672aa0aaa230bfa3f444eddd65b0','230302198402175333','赵俊鹏','',NULL,'13552471077',NULL,'2016080410000014',NULL,NULL,NULL,NULL,'1','1','2016-08-04 18:35:00','1','2016-08-04 18:35:00',NULL,'0'),('791290e1344945a993748b7df9a2b628','1','8dc8c943e1bd4c468c34308e9ce6a7eb','zhaojunpeng','1bc04d30bd444641898e5a561629be5ccf1bb4715a4f7343a1a4407a','zhaojunpeng','zhaojunpeng','','','',NULL,NULL,'','','0:0:0:0:0:0:0:1','2016-08-04 19:37:26','1','1','2016-08-04 15:36:44','1','2016-08-04 15:36:44','','0'),('7cfec60bc9c947f284bff8a0247fb500','1','ff0a982b3e954d61a5de9033402f5cf0','18801029601','02f8425974f10102bc07e85469b5de9e84eef196d01ba7cf4a1cb747','230302198402175301','李燕青','',NULL,'18801029601',NULL,'2016080410000015',NULL,NULL,'0:0:0:0:0:0:0:1','2016-08-04 19:39:40','1','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:17','791290e1344945a993748b7df9a2b628','2016-08-04 19:39:18',NULL,'0');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_role` (
  `user_id` varchar(64) NOT NULL COMMENT '用户编号',
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户-角色';
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
  `id` varchar(64) NOT NULL COMMENT '编号',
  `user_id` varchar(64) DEFAULT NULL COMMENT '归属用户',
  `office_id` varchar(64) DEFAULT NULL COMMENT '归属部门',
  `area_id` varchar(64) DEFAULT NULL COMMENT '归属区域',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `sex` char(1) DEFAULT NULL COMMENT '性别',
  `in_date` date DEFAULT NULL COMMENT '加入日期',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `test_data_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务数据表';
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
  `id` varchar(64) NOT NULL COMMENT '编号',
  `test_data_main_id` varchar(64) DEFAULT NULL COMMENT '业务主表ID',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `test_data_child_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务数据子表';
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
  `id` varchar(64) NOT NULL COMMENT '编号',
  `user_id` varchar(64) DEFAULT NULL COMMENT '归属用户',
  `office_id` varchar(64) DEFAULT NULL COMMENT '归属部门',
  `area_id` varchar(64) DEFAULT NULL COMMENT '归属区域',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `sex` char(1) DEFAULT NULL COMMENT '性别',
  `in_date` date DEFAULT NULL COMMENT '加入日期',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `test_data_main_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务数据表';
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
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `test_tree_del_flag` (`del_flag`),
  KEY `test_data_parent_id` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='树结构表';
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
  `id` varchar(64) NOT NULL COMMENT '编号',
  `openid` varchar(200) NOT NULL COMMENT '用户的标识，对当前公众号唯一',
  `precision` varchar(200) DEFAULT NULL COMMENT '地理位置精度',
  `latitude` varchar(200) DEFAULT NULL COMMENT '地理位置纬度',
  `longitude` varchar(200) DEFAULT NULL COMMENT '地理位置经度',
  `location_x` varchar(200) DEFAULT NULL COMMENT 'location_x',
  `location_y` varchar(200) DEFAULT NULL COMMENT 'location_y',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '状态',
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
  `id` varchar(64) NOT NULL COMMENT '编号',
  `subscribe` varchar(200) DEFAULT NULL COMMENT '用户是否订阅该公众号标识，值为0时，代表此用户没有关注该公众号，拉取不到其余信息。',
  `openid` varchar(200) NOT NULL COMMENT '用户的标识，对当前公众号唯一',
  `nickname` varchar(200) DEFAULT NULL COMMENT '用户的昵称',
  `sex` varchar(200) DEFAULT NULL COMMENT '用户的性别，值为1时是男性，值为2时是女性，值为0时是未知',
  `city` varchar(200) DEFAULT NULL COMMENT '用户所在城市',
  `country` varchar(200) DEFAULT NULL COMMENT '用户所在国家',
  `province` varchar(200) DEFAULT NULL COMMENT '用户所在省份',
  `language` varchar(200) DEFAULT NULL COMMENT '用户的语言，简体中文为zh_CN',
  `headimgurl` varchar(200) DEFAULT NULL COMMENT '用户头像，最后一个数值代表正方形头像大小（有0、46、64、96、132数值可选，0代表640*640正方形头像），用户没有头像时该项为空。若用户更换头像，原有头像URL将失效。',
  `subscribe_time` varchar(200) DEFAULT NULL COMMENT '用户关注时间，为时间戳。如果用户曾多次关注，则取最后关注时间',
  `unionid` varchar(200) DEFAULT NULL COMMENT '只有在用户将公众号绑定到微信开放平台帐号后，才会出现该字段。',
  `remark` varchar(200) DEFAULT NULL COMMENT '公众号运营者对粉丝的备注，公众号运营者可在微信公众平台用户管理界面对粉丝添加备注',
  `groupid` varchar(200) DEFAULT NULL COMMENT '用户所在的分组ID（兼容旧的用户分组接口）',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT NULL COMMENT '更新者',
  `update_date` datetime DEFAULT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `status` char(1) NOT NULL DEFAULT '0' COMMENT '已关注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wechat_member`
--

LOCK TABLES `wechat_member` WRITE;
/*!40000 ALTER TABLE `wechat_member` DISABLE KEYS */;
INSERT INTO `wechat_member` VALUES ('b324953094de4bed8c1e28c98c0cb3af','1','o4Sx-wMwxW9SO6QvaoasVDCgmF2k','蝶舞','女性','海淀','中国','北京','zh_CN','http://wx.qlogo.cn/mmopen/qENnrtFuS8djLf8ZANicW6FSB4llBZbfDSMibwUdyoSS6IsibLVML21XMqpzThLibhogaMhK7cjwUEnZZ4pTy8QUxKMO9LUs6icWV/0','1468920174',NULL,'','0',NULL,'2016-07-19 17:23:07',NULL,'2016-07-19 17:23:07',NULL,'0'),('bb349d8cbc784b489ee662007ddd34ec','1','o4Sx-wE6XiheDate5lBX9OO-gHxw','假装没感觉','男性','','中国','北京','zh_CN','http://wx.qlogo.cn/mmopen/PiajxSqBRaEIYzZGlQEAcia78RQJmuEiawc1rTIXNj2c7JbNLuHiag0QVKuPlDdYdBH4acrOYpy5eeEjX17JfVo7hA/0','1470125767',NULL,'','0',NULL,'2016-07-18 21:17:43',NULL,'2016-08-02 16:16:14',NULL,'0');
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
