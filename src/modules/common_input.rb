module CommonInput

  def verify_id
    print 'ID: '
    id = gets.chomp

    until id.match(/^[0-9]*$/)
      print 'Please input correct numeric id: '
      id = gets.chomp
    end

    puts id.to_i
  end

  def verify_publish_date
    print 'Publish Date [yyyy-mm-dd]: '
    date = gets.chomp.strip

    until date.match(/^\d{4}-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])$/)
      print 'Please input date in the correct format: '
      date = gets.chomp.strip
    end
    
    Date.strptime(date, '%Y-%m-%d')
  end
end
