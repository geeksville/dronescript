
# Goal
A uniform performant scripting language for use inside any drone or GCSes.

# Uses
FIXME

# Adapter API
A given vehicle/GCS platform must implement an 'adapter' so flsq can run in that environment.

# TODO before first alpha release

* Add license 
* Explain arch
  * Squirrel (modified for Nuttx)
  * Setjmp/longjmp
  * flying squirrel library - user level API for developing squirrel apps for vehicles(flsq)
  * flying squirrel adapter - the C/C++ stub which must be provided for any new autopilot library or GCS

* Fix capitalization of packet names
* Add mavlink library
* Add logging library
* Add debug library
* Make vario proof-of-concept
* Change vehicle init scripts to boot flsq if available
* For Nuttx/P4 handler
  * lower priority
  * use own heap
* For SITL handler
  * implement
* Add install instructions

# TODO eventually

* Optionally generate/check CRCs on mavlink packets
