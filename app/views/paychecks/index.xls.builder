excel_document(xml) do
 @payrolls.each do |period,data|
    xml.Worksheet 'ss:Name' => period.first.strftime("%d %b %Y")+" - "+period.last.strftime("%d %b %Y") do
      xml.Table do
        # Header
        xml.Row do
          xml.Cell { xml.Data 'Employee', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Pay Rate', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Pay period', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Salary', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Salary Adjustments', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Hours Worked', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Leave Earned', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Leave Taken', 'ss:Type' => 'String' }
          xml.Cell { xml.Data 'Leave Balance', 'ss:Type' => 'String' }
        end
         
        # Rows
        for paycheck in data[:paychecks]
          xml.Row do
            xml.Cell { xml.Data paycheck.employee.name, 'ss:Type' => 'String' }
            xml.Cell { xml.Data paycheck.pay_rate.name, 'ss:Type' => 'String' }
            xml.Cell { xml.Data paycheck.start_at.strftime("%d %b %Y") + " - "+ paycheck.end_at.strftime("%d %b %Y"), 'ss:Type' => 'String' }
            xml.Cell { xml.Data paycheck.total_pay, 'ss:Type' => 'Number' }
            xml.Cell { xml.Data paycheck.total_adjustments_pay, 'ss:Type' => 'Number' }
            xml.Cell { xml.Data paycheck.total_hours, 'ss:Type' => 'Number' }
            xml.Cell { xml.Data paycheck.total_leave, 'ss:Type' => 'Number' }
            xml.Cell { xml.Data paycheck.total_leave_taken, 'ss:Type' => 'Number' }
            xml.Cell { xml.Data paycheck.total_leave_balance, 'ss:Type' => 'Number' }
          end
        end

        xml.Row do 
         xml.Cell { xml.Data 'Kinyei Intl Total', 'ss:Type' => 'String'}
         xml.Cell { xml.Data number_with_precision data[:stats][:total_kinyei], 'ss:Type' => 'Number'}
        end
        xml.Row do 
         xml.Cell { xml.Data 'Soksabike Total', 'ss:Type' => 'String'}
         xml.Cell { xml.Data number_with_precision data[:stats][:total_soksa], 'ss:Type' => 'Number'}
        end
        xml.Row do 
         xml.Cell { xml.Data 'Cafe Total', 'ss:Type' => 'String'}
         xml.Cell { xml.Data number_with_precision data[:stats][:total_cafe], 'ss:Type' => 'Number'}
        end
        xml.Row do 
         xml.Cell { xml.Data 'Total Payroll', 'ss:Type' => 'String'}
         xml.Cell { xml.Data number_with_precision data[:stats][:total_payroll], 'ss:Type' => 'Number'}
        end
      end
    end
  end
end