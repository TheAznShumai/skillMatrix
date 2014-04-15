$(document).ready ->

  $ ->
      $('#ratings').dataTable(
          "sPaginationType": "bootstrap")

  $ ->
      $('#projects_with_admin').dataTable(
          "aoColumnDefs": [{ 'bSortable': false, 'aTargets': [ 5 ] }],
          "sPaginationType": "bootstrap")

  $ ->
      $('#projects').dataTable(
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

  $ ->
      $('#profile-skills').dataTable(
          "sDom": 'ftrip',
          "bLengthChange": false,
          "sPaginationType": "bootstrap")

