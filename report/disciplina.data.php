<h1 class="text-md text-center"><?=$titulo?></h1>

<table class="table table-border mt-3">
  <colgroup>
    <col style='width: 20%'>
    <col style='width: 80%'>
  </colgroup>
  <thead>
    <tr>
      <th class="text-center" >ID</th>
      <th class="text-center" >Nombre de disciplina</th>
    </tr>
  </thead>
  <tbody>
    <?php foreach($datos as $registro): ?>
      <tr>
        <td><?=$registro[0]?></td>
        <td><?=$registro[1]?></td>
      </tr>
    <?php endforeach; ?>
  </tbody>
</table>