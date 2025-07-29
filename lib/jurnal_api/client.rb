module JurnalApi
  # Wrapper for the JurnalApi REST API
  class Client < API
    Dir[File.expand_path('../client/*.rb', __FILE__)].each{|f| require f}

    include JurnalApi::Client::Accounts
    include JurnalApi::Client::BankTransfer
    include JurnalApi::Client::Customers
    include JurnalApi::Client::JournalEntries
    include JurnalApi::Client::PaymentMethods
    include JurnalApi::Client::Products
    include JurnalApi::Client::PurchaseInvoices
    include JurnalApi::Client::PurchaseReturn
    include JurnalApi::Client::PurchaseDeliveries
    include JurnalApi::Client::PurchaseOrders
    include JurnalApi::Client::RecurringSchedules
    include JurnalApi::Client::ReceivePayment
    include JurnalApi::Client::SalesOrderPayments
    include JurnalApi::Client::SalesOrders
    include JurnalApi::Client::SalesDeliveries
    include JurnalApi::Client::SalesInvoices
    include JurnalApi::Client::SalesReturn
    include JurnalApi::Client::UnitConversions
    include JurnalApi::Client::HealthChecks
    include JurnalApi::Client::ProductUnits
    include JurnalApi::Client::PurchaseOrderPayments
    include JurnalApi::Client::Tags
    include JurnalApi::Client::Vendors
  end
end
