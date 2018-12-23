package kim.glushkova.springboottextdocker.repo.dao;

import lombok.Builder;
import lombok.Data;
import lombok.ToString;

import java.time.LocalDateTime;

/**
 *
 */
@Data
@Builder
@ToString
public class Voting {
  private long id;
  private String title;
  private LocalDateTime createdAt;
  private LocalDateTime lastVote;
  private int votes;
}
