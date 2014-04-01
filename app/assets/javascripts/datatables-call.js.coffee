$(document).ready ->

  $ ->
      $('#ratings').dataTable(
          "sPaginationType": "bootstrap")

  $ ->
      $('#submissions').dataTable(
          "aoColumnDefs": [{ 'bSortable': false, 'aTargets': [ 0,6 ] }],
          "sPaginationType": "bootstrap")

  $ ->
      $('#attempts').dataTable(
          "bLengthChange": false,
          "sPaginationType": "bootstrap")

  $ ->
      $('#users').dataTable(
          "bLengthChange": false,
          "sPaginationType": "bootstrap")

