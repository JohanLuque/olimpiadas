<h1 class="text-md text-center"><?=$titulo?></h1>

<table class="table table-border mt-3">
  <colgroup>
    <col style='width: 20%'>
    <col style='width: 60%'>
    <col class="text-center" style='width: 20%'>
  </colgroup>
  <thead>
    <tr>
      <th>ID</th>
      <th>Equipo</th>
      <th>Puesto</th>
    </tr>
  </thead>
  <tbody>
    <?php foreach($datos as $registro): ?>
      <tr>
        <td><?=$registro['idmedallero']?></td>
        <td><?=$registro['equipo']?></td>
        <td><?=$registro['puesto']?></td>
      </tr>
    <?php endforeach; ?>
  </tbody>
</table>