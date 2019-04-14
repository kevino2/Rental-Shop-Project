<h1>Rental</h1>

<form action="/rentals" method="post">
  <label>
  Select a customer:
    <select name="customer_id">
      <% for customer in @customers %>
      <option value="<%= customer.id %>"><%= customer.name %></option>
     <% end %>
    </select>
  </label>

  <label>
    Select stock item:
    <select name="stock_id">
      <% for stock in @stocks %>
      <option value="<%= stock.id %>"><%= stock.name %></option>
      <% end %>
    </select>
  </label>

  <input class="btn btn--action" type='submit' value="Confirm">
</form>
