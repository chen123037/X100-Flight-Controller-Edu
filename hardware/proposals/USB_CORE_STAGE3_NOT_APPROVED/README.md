# USB core Stage 3 — NOT APPROVED / NOT FOR FABRICATION

This is a structural candidate, not hardware/X100_V1. Open project/X100_CleanSheet.kicad_pro in KiCad 10. It contains 240 electrical symbols, 244 PCB footprints including holes, and no routing. All 39 added footprints remain stacked at the PCB origin; do not submit it to a manufacturer or run automatic routing as if placement were finished.

[Chinese review and assumptions](../../../docs/USB_CORE_STAGE3_REVIEW.md) and [first-board test plan](../../../docs/FIRST_BOARD_USB_BRINGUP.md) state the remaining limits. Candidate ERC=0/0 and schematic parity=0 establish structural checks only. New power architecture/exact IC MPNs are not formally approved. No procurement, USB compliance, DRC, power-safety or manufacturing PASS is asserted.

The symbol library uses ${KIPRJMOD}. Standard KiCad footprints require the KiCad 10 libraries. SHA256SUMS.json identifies this checkpoint. Formal source remains hardware/X100_V1.
