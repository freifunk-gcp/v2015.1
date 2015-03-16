Gluon Community Packages for the current Master
===============================================

In this repository you can find packages, which are compatible with the current Master of Gluon.
As this is going to be Gluon v2015.1 this Repo got this name.

List of packages:
-----------------
* gluon-luci-site-select
  * This package contains a script for the expertmode, which is capable of changing a Routers config by replacing the "site.conf". It will occure in the a tab called "Community".
* gluon-config-mode-site-select
  * This package does the same thing as gluon-luci-site-select, except it occures in the wizzard. This might be usefull for Communitys, which run different domains, which are seperated due the scaling-issue.
* gluon-luci-wifi-config
  * this packages provides a tab in expertmode where you can dis/enable the SSIDs of your Router. This is verry usefull, when you want a router to mesh only on one band or if you want to create a  backbone router.


Concept of this repository :
----------------------------
 * one Git repository for every git repositorx which is not in te core packages
  * Core packages are packages which are supported and updated by tcatm and neoraider
  * all other packagest (e.g. privat-wifi, wifi-config) are addons
  * wird von mehreren Head-Maintainern verwaltet (DO9XE & pberndro)
  * für jede Gluon Version wird ein eigener Branch angelegt, um backports zu ermöglichen
 * Jedes Paket hat einen Maintainer, dieser kann gewechselt werden. hat ein Paket keinen Maintainer mehr und es findet sich kein neuer wird der Support ab dem Zeitpunkt der Inkompatibilität mit Gluon gestoppt.
  * bei Jeder neuen Gluonversion werden die Maintainer der GUR Pakete rechzeitig benachrichtigt, um Pakete auf Kompatibilität mit dem neuen Gluon zu prüfen.
   * Ist ein Paket nicht mit der neuen Version kompatibel muss es nachgebessert werden, sonst wird der Support (vorrübergehend) eingestellt.
   * Support kann wieder aufgenommen werden, wenn ein kompatibles Paket geliefert wird.
 * Über Aufnahme in die GURs entscheiden die Head-Maintainer in hinsicht auf Funktion und Dopplungen.
 * Pakete werden wie gewohnt in der site.mk eingebunden, modules-file wird gestellt
 * evtl einen Paketmanager schreiben, der einzelne Pakete installieren kann, welche auch Updates überleben.