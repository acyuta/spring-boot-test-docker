package kim.glushkova.springboottextdocker.repo.dao;

import lombok.Builder;
import lombok.Data;
import lombok.ToString;

import java.util.UUID;

/**
 *
 */
@Data
@Builder
@ToString
public class Answer {
  private String id;
  private long votingId;
  private String answer;
}
