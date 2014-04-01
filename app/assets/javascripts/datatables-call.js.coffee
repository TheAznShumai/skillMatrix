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
          "sDom": 'ftrip',
          "bLengthChange": false,
          "aoColumnDefs": [{ 'bSortable': false, 'aTargets': [ 2 ] }],
          "sPaginationType": "bootstrap")

  $ ->
      $('#users').dataTable(
          "sDom": 'ftrip',
          "bLengthChange": false,
          "aoColumnDefs": [{ 'bSortable': false, 'aTargets': [ 4 ] }],
          "sPaginationType": "bootstrap")

